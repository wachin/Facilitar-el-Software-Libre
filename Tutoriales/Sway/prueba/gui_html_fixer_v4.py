import tkinter as tk
from tkinter import filedialog
from bs4 import BeautifulSoup

def mejorar_elementos_code(html):
    """
    Mejora la apariencia de los elementos <code> simples.
    Aplica un estilo similar al de código pero más simple que los bloques <pre>
    """
    soup = BeautifulSoup(html, 'html.parser')
    
    for code in soup.find_all('code'):
        # Si el elemento code no está dentro de un pre (para no duplicar estilos)
        if not code.find_parent('pre'):
            code['style'] = (
                "background: #f5f5f5; "          # Fondo gris muy claro
                "border: 1px solid #d0d0d0; "    # Borde sutil
                "border-radius: 3px; "           # Esquinas redondeadas
                "padding: 1px 4px; "             # Espaciado interno
                "font-family: 'Ubuntu Mono', Consolas, monospace; font-weight: bold; "  # Fuente monoespaciada principal Ubuntu, luego Consolas
                "color: #c7254e; "               # Color de texto rojo oscuro
                "font-size: 90%; "               # Tamaño ligeramente reducido
            )
    return str(soup)

def mejorar_caja_codigo(html):
    """
    Mejora la apariencia de las cajas de código <pre class="sourceCode">.
    Versión ajustada sin separación entre la barra y el contenido.
    """
    soup = BeautifulSoup(html, 'html.parser')
    
    for pre in soup.find_all('pre', class_='sourceCode'):
        # Primero creamos un contenedor para agrupar la barra y el contenido
        container = soup.new_tag('div', style=(
            "margin: 15px 0; "
            "border-radius: 6px; "
            "overflow: hidden; "
            "box-shadow: 0 4px 8px rgba(0,0,0,0.2);"
        ))
        pre.wrap(container)
        
        # Estilo mejorado para el pre (contenido del código)
        pre['style'] = (
            "background: #1e1e1e; "                 # Fondo oscuro
            "color: #f0f0f0; "                     # Texto claro
            "font-family: 'Ubuntu Mono', 'Courier New', monospace; "
            "font-weight: bold; "                   # Texto en negrita
            "font-size: 14px; "
            "line-height: 1.5; "
            "margin: 0; "                           # Eliminamos margen interno
            "padding: 12px 20px; "
            "border-left: 4px solid #3aa655; "      # Borde izquierdo verde
            "overflow: auto; "
            "max-height: 500px; "
        )
        
        # Barra de terminal ajustada
        terminal_bar = soup.new_tag('div', style=(
            "background: #3a3a3a; "
            "height: 28px; "
            "display: flex; "
            "align-items: center; "
            "padding: 0 15px; "
            "border-bottom: 1px solid #2a2a2a; "    # Línea divisoria sutil
        ))
        
        # Puntos de la barra de terminal
        for color in ['#ff5f56', '#ffbd2e', '#27c93f']:
            dot = soup.new_tag('span', style=(
                f"background: {color}; "
                "width: 12px; "
                "height: 12px; "
                "border-radius: 50%; "
                "margin-right: 8px; "
            ))
            terminal_bar.append(dot)
        
        # Insertamos la barra antes del pre dentro del contenedor
        container.insert(0, terminal_bar)
        
        # Ajustamos el código interno
        for code in pre.find_all('code'):
            code['style'] = "color: inherit; font-family: inherit;"
    
    return str(soup)

def mejorar_tablas(html, porcentaje_fuente):
    """
    Mejora la apariencia de las tablas HTML.
    - Aplica colores de encabezado, filas alternas y bordes.
    - Hace que el texto largo se ajuste y no se corte.
    - Envuela cada tabla en un <div> desplazable para diseño responsive.
    """
    soup = BeautifulSoup(html, 'html.parser')
    
    for table in soup.find_all('table'):
        # --- Estilo base de la tabla ---
        # NOTA: para cambiar color de todos los bordes, editar 'border: 1px solid #333333'
        estilo_base = (
            "border-collapse: collapse; width: 100%; table-layout: auto; "
            "white-space: normal; word-break: normal; overflow-wrap: break-word; "
            "border: 1px solid #333333;"  # <-- Cambiar color del borde general aquí
        )
        if porcentaje_fuente:
            estilo_base += f" font-size: {porcentaje_fuente};"
        table['style'] = estilo_base

        # --- Colores de filas ---
        # Encabezado: rojo claro (#fcebea)
        # Filas impares: blanco (#ffffff)
        # Filas pares: gris suave (#f9f9f9)
        for i, row in enumerate(table.find_all('tr')):
            if i == 0:
                row['style'] = "background-color: #fcebea;"   # <-- Cambiar color encabezado
            elif i % 2 == 1:
                row['style'] = "background-color: #ffffff;"   # <-- Cambiar color filas impares
            else:
                row['style'] = "background-color: #f9f9f9;"   # <-- Cambiar color filas pares

        # --- Estilo de celdas (bordes oscuros #333333) ---
        for th in table.find_all('th'):
            th['style'] = (
                "border: 1px solid #333333; padding: 8px; text-align: left; "
                "white-space: normal; word-break: normal; overflow-wrap: break-word;"
            )

        for td in table.find_all('td'):
            td['style'] = (
                "border: 1px solid #333333; padding: 8px; text-align: left; "
                "white-space: normal; word-break: normal; overflow-wrap: break-word;"
            )

        # --- Envolver la tabla en un div desplazable (responsive) ---
        wrapper = soup.new_tag('div', **{
            "style": "width: 100%; overflow-x: auto; margin-bottom: 1em;"
        })
        table.insert_before(wrapper)
        wrapper.append(table.extract())
    
    return str(soup)

def mejorar_bloques_code_simples(html):
    """
    Mejora la apariencia de los bloques <pre><code> simples que no tienen clase sourceCode.
    Versión mejorada con mejor contraste y legibilidad.
    """
    soup = BeautifulSoup(html, 'html.parser')
    
    for pre in soup.find_all('pre'):
        # Solo procesamos los pre que contienen code directamente y no son de clase sourceCode
        if pre.code and not pre.get('class'):
            # Creamos el nuevo div contenedor
            div = soup.new_tag('div')
            pre.wrap(div)
            
            # Estilo mejorado para el pre
            pre['style'] = (
                "background-color: #f8f8f8; "  # Fondo más claro para mejor contraste
                "border: 1px solid #d0d0d0; "  # Borde sólido en lugar de dashed
                "border-left: 3px solid #d44950; "  # Borde izquierdo acentuado
                "line-height: 1.5; "  # Mejor espaciado entre líneas
                "margin: 10px 0; "  # Margen más equilibrado
                "overflow-wrap: break-word; "
                "padding: 10px; "  # Más padding para mejor legibilidad
                "border-radius: 4px; "  # Esquinas ligeramente redondeadas
            )
            
            # Creamos el span para el contenido con mejor contraste
            span_outer = soup.new_tag('span', style=(
                "color: #222222; "  # Color casi negro para mejor contraste
                "font-family: 'Ubuntu Mono', 'Courier New', monospace; "
                "font-weight: bold; "  # Fuente en negrita
            ))
            
            span_inner = soup.new_tag('span', style=(
                "font-size: 15px; "  # Tamaño ligeramente mayor
                "white-space: pre-wrap; "
            ))
            
            # Movemos el contenido del code al span interno
            code = pre.code
            span_inner.string = code.get_text()
            
            # Reconstruimos la estructura
            span_outer.append(span_inner)
            pre.clear()
            pre.append(span_outer)
    
    return str(soup)

def procesar_archivo(entry_fuente):
    """
    Procesa el archivo HTML seleccionado:
    - Aplica mejoras en cajas de código, elementos code y tablas
    - Guarda el resultado en un archivo con sufijo '-fix.html'
    """
    porcentaje_fuente = entry_fuente.get().strip()
    if porcentaje_fuente and not porcentaje_fuente.endswith('%'):
        porcentaje_fuente += '%'
    
    filepath = filedialog.askopenfilename(filetypes=[("Archivos HTML", "*.html")])
    if not filepath:
        return
    
    with open(filepath, 'r', encoding='utf-8') as file:
        html = file.read()
    
    html = mejorar_elementos_code(html)
    html = mejorar_caja_codigo(html)
    html = mejorar_tablas(html, porcentaje_fuente)
    html = mejorar_bloques_code_simples(html)  # <-- Nueva función añadida
    
    output_filepath = filepath.replace(".html", "-fix.html")
    with open(output_filepath, 'w', encoding='utf-8') as file:
        file.write(html)
    
    resultado_label.config(text=f"Archivo guardado en: {output_filepath}")

def crear_gui():
    """
    Crea la interfaz gráfica:
    - Entrada para tamaño de fuente
    - Botón para seleccionar archivo
    - Etiqueta para mostrar resultado
    """
    root = tk.Tk()
    root.title("Mejorador de HTML")
    root.geometry("460x250")
    
    label_fuente = tk.Label(root, text="Elije el tamaño de la fuente de la tabla (ej: 90%, 100%, etc):")
    label_fuente.pack(pady=5)
    
    entry_fuente = tk.Entry(root)
    entry_fuente.insert(0, "95%")  # Valor por defecto
    entry_fuente.pack(pady=5)
    
    boton_procesar = tk.Button(root, text="Seleccionar archivo HTML", command=lambda: procesar_archivo(entry_fuente))
    boton_procesar.pack(pady=20)
    
    global resultado_label
    resultado_label = tk.Label(root, text="")
    resultado_label.pack(pady=10)
    
    root.mainloop()

if __name__ == "__main__":
    crear_gui()
