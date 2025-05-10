import tkinter as tk
from tkinter import filedialog
from bs4 import BeautifulSoup

def mejorar_caja_codigo(html):
    """Mejora la apariencia de la caja de código en el HTML."""
    soup = BeautifulSoup(html, 'html.parser')
    
    for pre in soup.find_all('pre', class_='sourceCode'):
        pre['style'] = "background: rgb(231, 232, 233); border-color: rgb(214, 73, 55); " \
                      "border-style: solid; border-width: 1px 1px 1px 20px; font-family: 'Ubuntu Mono', Courier, monospace; " \
                      "font-size: medium; line-height: 22.4px; margin: 10px; max-height: 500px; min-height: 16px; " \
                      "overflow: auto; padding: 28px 10px 10px 20px; z-index: 10000;"
    return str(soup)

def mejorar_tablas(html, porcentaje_fuente):
    """Mejora la apariencia de las tablas en el HTML."""
    soup = BeautifulSoup(html, 'html.parser')
    
    for table in soup.find_all('table'):
        estilo_base = "border-collapse: collapse; width: 100%;"
        
        # Aplicar tamaño de fuente si el porcentaje es válido
        if porcentaje_fuente:
            estilo_base += f" font-size: {porcentaje_fuente};"
        
        table['style'] = estilo_base
        
        for i, row in enumerate(table.find_all('tr')):
            if i == 0:
                row['style'] = "background-color: #eaecf0ff;"
            elif i % 2 == 1:
                row['style'] = "background-color: #ffffffff;"
            else:
                row['style'] = "background-color: #eff0ffff;"
        
        for th in table.find_all('th'):
            th['style'] = "border: 1px solid black; padding: 8px; text-align: left;"
        
        for td in table.find_all('td'):
            td['style'] = "border: 1px solid black; padding: 8px; text-align: left;"
        
        # Envolver en un bloque desplazable
        wrapper = soup.new_tag('pre', **{
            "class": "table-code-box",
            "style": "background-color: #f9f9f9; padding: 10px; border: 1px solid #ddd; overflow-x: auto;"
        })
        table.insert_before(wrapper)
        wrapper.append(table.extract())
    
    return str(soup)

def procesar_archivo(entry_fuente):
    """Procesa el archivo seleccionado y genera la versión mejorada."""
    porcentaje_fuente = entry_fuente.get().strip()
    if porcentaje_fuente and not porcentaje_fuente.endswith('%'):
        porcentaje_fuente += '%'  # Asegurar formato correcto
    
    filepath = filedialog.askopenfilename(filetypes=[("Archivos HTML", "*.html")])
    if not filepath:
        return
    
    with open(filepath, 'r', encoding='utf-8') as file:
        html = file.read()
    
    html = mejorar_caja_codigo(html)
    html = mejorar_tablas(html, porcentaje_fuente)
    
    output_filepath = filepath.replace(".html", "-fix.html")
    with open(output_filepath, 'w', encoding='utf-8') as file:
        file.write(html)
    
    resultado_label.config(text=f"Archivo guardado en: {output_filepath}")

def crear_gui():
    """Crea la interfaz gráfica de la aplicación."""
    root = tk.Tk()
    root.title("Mejorador de HTML")
    root.geometry("460x250")
    
    label_fuente = tk.Label(root, text="Elije el tamaño de la fuente de la tabla (ej: 90%, 100%, etc):")
    label_fuente.pack(pady=5)
    
    entry_fuente = tk.Entry(root)
    entry_fuente.insert(0, "75%")  # Valor por defecto
    entry_fuente.pack(pady=5)
    
    boton_procesar = tk.Button(root, text="Seleccionar archivo HTML", command=lambda: procesar_archivo(entry_fuente))
    boton_procesar.pack(pady=20)
    
    global resultado_label
    resultado_label = tk.Label(root, text="")
    resultado_label.pack(pady=10)
    
    root.mainloop()

if __name__ == "__main__":
    crear_gui()
