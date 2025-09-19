# -*- coding: utf-8 -*-
import re
from com.sun.star.beans import PropertyValue
from com.sun.star.uno import Exception as UnoException

# ====== UTIL ======
def get_desktop(ctx):
    smgr = ctx.ServiceManager
    return smgr.createInstanceWithContext("com.sun.star.frame.Desktop", ctx)

def get_ctx():
    import uno
    return uno.getComponentContext()

def mk_props(**kwargs):
    arr = []
    for k, v in kwargs.items():
        pv = PropertyValue()
        pv.Name = k
        pv.Value = v
        arr.append(pv)
    return tuple(arr)

# ====== PARSER CHORDPRO -> líneas con offsets ======
CHORD_RE = re.compile(r"\[([A-G][#b]?(?:m|maj|min|dim|aug|sus|add)?\d*)\]")

def parse_cho(text):
    """
    Devuelve lista de (texto_sin_tokens, [(offset, 'C'), ...]) por línea.
    """
    out = []
    for raw in text.splitlines():
        line = raw.rstrip("\n")
        chords = []
        buf = []
        pos = 0
        last = 0
        for m in CHORD_RE.finditer(line):
            literal = line[last:m.start()]
            buf.append(literal)
            pos += len(literal)
            chords.append((pos, m.group(1)))
            last = m.end()
        rest = line[last:]
        buf.append(rest)
        out.append(("".join(buf), chords))
    return out

# ====== RUBY INSERCIÓN EN WRITER ======
def insert_paragraph_with_ruby(doc, cursor, text, chords):
    """
    Inserta 'text' y aplica RUBY sobre el carácter en cada offset de ese
    párrafo recién insertado. Cursor de párrafo anclado al punto real de
    inserción para evitar que sólo se marque el primer párrafo.
    """
    text_ifc = doc.Text

    # 1) Insertar el texto y el salto de párrafo en 'cursor' (cursor queda
    #    AL FINAL del nuevo párrafo, es decir, en el comienzo del siguiente)
    text_ifc.insertString(cursor, text, False)
    from com.sun.star.text.ControlCharacter import PARAGRAPH_BREAK
    text_ifc.insertControlCharacter(cursor, PARAGRAPH_BREAK, False)

    # 2) Crear un cursor de párrafo ANCLADO a 'cursor' y retroceder
    #    al párrafo que acabamos de insertar
    para_cursor = text_ifc.createTextCursorByRange(cursor)  # anclado a la pos actual
    # nos movemos al párrafo anterior (el recién insertado)
    para_cursor.gotoPreviousParagraph(False)  # ahora está en el inicio del párrafo insertado

    # 3) Formato base del párrafo (monoespaciado)
    para_cursor.setAllPropertiesToDefault()
    para_cursor.CharFontName = "Noto Mono"
    para_cursor.CharHeight = 11.0

    # Función helper: intentar crear servicio Ruby si existe en esta build
    def _create_ruby_service():
        try:
            return doc.createInstance("com.sun.star.text.Ruby")
        except Exception:
            return None

    # 4) Aplicar rubies (o fallbacks) en este párrafo
    for (offset, name) in chords:
        if offset < 0:
            offset = 0
        if offset >= len(text):
            offset = max(0, len(text) - 1)

        # Selección EXACTA del carácter base en este párrafo:
        # arrancamos del INICIO de 'para_cursor'
        sel = text_ifc.createTextCursorByRange(para_cursor.getStart())
        sel.goRight(offset, False)  # mover caret 'offset' chars
        sel.goRight(1, True)        # seleccionar 1 carácter

        # Camino 1: servicio Ruby nativo
        ruby_svc = _create_ruby_service()
        if ruby_svc is not None:
            try:
                ruby_svc.RubyText = name
                ruby_svc.RubyIsAbove = True
                ruby_svc.RubyAdjust = 1  # centrado
                text_ifc.insertTextContent(sel, ruby_svc, True)
                continue
            except Exception:
                pass  # si falla, probamos camino 2

        # Camino 2: propiedades Ruby sobre el rango
        try:
            sel.setPropertyValue("RubyText", name)
            try:
                sel.setPropertyValue("RubyIsAbove", True)
            except Exception:
                pass
            try:
                sel.setPropertyValue("RubyAdjust", 1)
            except Exception:
                pass
            continue
        except Exception:
            # Camino 3: fallback visual (superíndice)
            base_start = sel.getStart()
            before = text_ifc.createTextCursorByRange(base_start)
            before.CharEscapement = 60            # superíndice
            before.CharEscapementHeight = 60
            before.CharWeight = 150               # negrita
            text_ifc.insertString(before, name, False)
            # restaurar
            before.CharEscapement = 0
            before.CharEscapementHeight = 100
            before.CharWeight = 100
            text_ifc.insertString(before, "\u2009", False)  # thin space
            continue

# ====== CONFIGURAR PÁGINA: A4, 2 columnas, márgenes ======
def configure_page_A4_two_columns(doc):
    """
    Configura un estilo de página (robusto en nombres/locales):
    - Tamaño A4 vertical
    - Márgenes 15 mm
    - 2 columnas (intenta auto-ancho si está disponible)
    """
    sf = doc.getStyleFamilies()
    page_styles = sf.getByName("PageStyles")

    # Buscar un estilo 'por defecto' por varios nombres; si no, tomar el primero
    candidates = (
        "Default Page Style", "Standard", "Predeterminado",
        "Estilo de página predeterminado", "Predefinito", "Standardseite", "Стандарт",
    )
    names = tuple(page_styles.getElementNames())
    target = None
    for nm in candidates:
        if nm in names:
            target = page_styles.getByName(nm)
            break
    if target is None:
        if not names:
            raise RuntimeError("No hay estilos de página disponibles.")
        target = page_styles.getByName(names[0])

    # Unidades: 1/100 mm
    target.Width = 21000     # 210 mm
    target.Height = 29700    # 297 mm
    target.IsLandscape = False

    target.LeftMargin   = 1500
    target.RightMargin  = 1500
    target.TopMargin    = 1500
    target.BottomMargin = 1500

    # 2 columnas
    # Toma el objeto existente de columnas para evitar incompatibilidades de servicio
    cols = target.TextColumns
    cols.ColumnCount = 2

    # Algunas builds tienen AutoWidth, otras IsAutomatic, otras ninguna.
    # Intentamos en orden y si no existe, lo dejamos con el ancho por defecto.
    try:
        cols.AutoWidth = True
    except Exception:
        try:
            cols.IsAutomatic = True
        except Exception:
            pass  # dejamos los anchos por defecto

    # Escribimos de vuelta el objeto modificado
    target.TextColumns = cols

# ====== COMANDO PRINCIPAL: importar .cho ======
def import_chordpro_as_ruby():
    ctx = get_ctx()
    desktop = get_desktop(ctx)

    # Diálogo para elegir archivo .cho
    filepicker = ctx.ServiceManager.createInstanceWithContext(
        "com.sun.star.ui.dialogs.FilePicker", ctx)
    filepicker.initialize( (0,) )  # FILEOPEN_SIMPLE
    filepicker.appendFilter("ChordPro (*.cho)", "*.cho")
    filepicker.setCurrentFilter("ChordPro (*.cho)")
    ret = filepicker.execute()
    if ret != 1:
        return
    files = filepicker.getFiles()
    if not files:
        return
    url = files[0]  # URL en formato file:///...

    # Leer archivo (como texto plano desde Python)
    import urllib.parse, urllib.request, os
    path = urllib.parse.urlparse(url).path
    path = urllib.request.url2pathname(path)
    with open(path, "r", encoding="utf-8") as f:
        cho_text = f.read()

    # Crear documento Writer
    doc = desktop.loadComponentFromURL(
        "private:factory/swriter", "_blank", 0, ())

    # Página A4, 2 columnas, márgenes
    configure_page_A4_two_columns(doc)

    # Insertar contenido línea por línea con rubies
    text_ifc = doc.Text
    cursor = text_ifc.createTextCursor()
    cursor.gotoStart(False)

    parsed = parse_cho(cho_text)
    for (plain, chords) in parsed:
        # metadatos {title: ...} etc: puedes formatearlos como quieras
        if plain.startswith("{") and plain.endswith("}"):
            # Trátalo como línea normal (o aplica estilo)
            insert_paragraph_with_ruby(doc, cursor, plain, [])
        else:
            insert_paragraph_with_ruby(doc, cursor, plain, chords)

    # Monoespaciada por defecto en todo
    allc = text_ifc.createTextCursor()
    allc.gotoStart(False); allc.gotoEnd(True)
    allc.CharFontName = "Noto Mono"
    allc.CharHeight = 11.0

    # Hecho
    doc.setModified(False)

# ====== TOGGLE: mostrar/ocultar acordes (ruby) ======
def toggle_ruby_chords():
    """
    Alterna la visibilidad de los acordes:
      - Si hay porciones Ruby: vacía/restaura RubyText (usa UserData para guardar).
      - Si se usó fallback visual: alterna superíndice (aprox) buscando CharEscapement > 0
    """
    ctx = get_ctx()
    desktop = get_desktop(ctx)
    doc = desktop.getCurrentComponent()
    if doc is None or not hasattr(doc, "Text"):
        return

    text = doc.Text
    enum_par = text.createEnumeration()
    toggled = 0

    while enum_par.hasMoreElements():
        par = enum_par.nextElement()
        pors = par.createEnumeration()
        while pors.hasMoreElements():
            tp = pors.nextElement()
            tpt = getattr(tp, "TextPortionType", "")
            handled = False

            # Caso A: porción Ruby nativa
            if tpt == "Ruby" and hasattr(tp, "Ruby"):
                ruby = tp.Ruby
                if getattr(ruby, "RubyText", ""):
                    setattr(ruby, "UserData", ruby.RubyText)
                    ruby.RubyText = ""
                else:
                    prev = getattr(ruby, "UserData", "")
                    if prev:
                        ruby.RubyText = prev
                        setattr(ruby, "UserData", "")
                toggled += 1
                handled = True

            # Caso B: Ruby aplicado como propiedad en porción "Text"
            if not handled and hasattr(tp, "TextPortionType") and tpt == "Text":
                try:
                    prop = tp.getPropertySetInfo()
                    if prop.hasPropertyByName("RubyText"):
                        val = tp.getPropertyValue("RubyText")
                        if val:
                            tp.setPropertyValue("UserDefinedAttributes", (("RubyBackup", val),))
                            tp.setPropertyValue("RubyText", "")
                        else:
                            # intentar restaurar desde UserDefinedAttributes
                            uda = tp.getPropertyValue("UserDefinedAttributes")
                            restore = ""
                            for k, v in uda or ():
                                if k == "RubyBackup":
                                    restore = v
                                    break
                            if restore:
                                tp.setPropertyValue("RubyText", restore)
                                tp.setPropertyValue("UserDefinedAttributes", ())
                        toggled += 1
                        handled = True
                except Exception:
                    pass

            # Caso C: fallback: detectar superíndice y alternarlo (aprox)
            if not handled and hasattr(tp, "CharEscapement"):
                try:
                    if tp.CharEscapement != 0 or tp.CharEscapementHeight != 100:
                        # “Ocultar”: poner tamaño normal y color fondo
                        if getattr(tp, "CharColor", None) is not None:
                            tp.CharColor = doc.CurrentController.Frame.ContainerWindow.BackgroundColor
                        tp.CharEscapement = 0
                        tp.CharEscapementHeight = 100
                    else:
                        # “Mostrar”: superíndice ligero
                        tp.CharEscapement = 60
                        tp.CharEscapementHeight = 60
                    toggled += 1
                except Exception:
                    pass

    # opcional: beep si nada cambió
    if toggled == 0:
        try:
            doc.CurrentController.Frame.ContainerWindow.getToolkit().beep()
        except Exception:
            pass
