import tkinter as tk
from tkinter import filedialog, ttk
import markdown
import re
from bs4 import BeautifulSoup
import os
import json

# Necesitas: sudo apt install python3-bs4 python3-markdown python3-tk tk-dev
# https://github.com/wachin/Markdown-to-Blogger-posts

# Función para cargar la configuración
def load_config():
    default_config = {"code_box": '<pre class="linux-code" style="background: url(https://lh3.googleusercontent.com/-E2WZ-k5ArbU/VnnAeX-_qmI/AAAAAAAABDU/i1aaUUYLZh8/s540-Ic42/lincodewachin.gif) 0px 0px no-repeat scroll rgb(231, 232, 233); border-color: rgb(214, 73, 55); border-style: solid; border-width: 1px 1px 1px 20px; font-family: \'UbuntuBeta Mono\', \'Ubuntu Mono\', \'Courier New\', Courier, monospace; font-size: medium; line-height: 22.3999996185303px; margin: 10px; max-height: 500px; min-height: 16px; overflow: auto; padding: 28px 10px 10px; z-index: 10000;"><code>{code}</code></pre>'}
    try:
        with open('save.json', 'r') as f:
            content = f.read().strip()
            if not content:
                raise ValueError("El archivo está vacío.")
            return json.loads(content)
    except (FileNotFoundError, ValueError):
        with open('save.json', 'w') as f:
            json.dump(default_config, f)
        return default_config

# Función para guardar la configuración
def save_config():
    config = {"code_box": code_box_entry.get()}
    with open('save.json', 'w') as f:
        json.dump(config, f)
    status_label.config(text="Configuración guardada")

# Cargar la configuración
config = load_config()

def select_input_file():
    initial_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "Conversiones")
    file_path = filedialog.askopenfilename(
        initialdir=initial_dir,
        filetypes=[("Markdown files", "*.md")]
    )
    if file_path:
        input_entry.delete(0, tk.END)
        input_entry.insert(0, file_path)

        # Actualizar automáticamente el campo de salida
        output_path = os.path.splitext(file_path)[0] + ".html"
        output_entry.delete(0, tk.END)
        output_entry.insert(0, output_path)

def select_output_file():
    initial_file = output_entry.get()
    file_path = filedialog.asksaveasfilename(
        initialfile=os.path.basename(initial_file),
        defaultextension=".html",
        filetypes=[("HTML files", "*.html")]
    )
    if file_path:
        output_entry.delete(0, tk.END)
        output_entry.insert(0, file_path)

def convert_markdown_to_blogger():
    input_file = input_entry.get()
    output_file = output_entry.get()

    with open(input_file, 'r', encoding='utf-8') as md_file:
        markdown_content = md_file.read()

    code_block_pattern = re.compile(r'```(.*?)```', re.DOTALL)

    def replace_code_block(match):
        code = match.group(1).strip()
        code = re.sub(r'&', '&amp;', code)
        code = re.sub(r'<', '&lt;', code)
        code = re.sub(r'>', '&gt;', code)
        code = re.sub(r'"', '&quot;', code)
        code = re.sub(r"'", '&#39;', code)
        return code_box_entry.get().format(code=code)

    markdown_content = re.sub(code_block_pattern, replace_code_block, markdown_content)
    markdown_content = re.sub(r'`([^`]+)`', r'<b>\1</b>', markdown_content)
    html_content = markdown.markdown(markdown_content, extensions=['fenced_code'])

    soup = BeautifulSoup(html_content, 'html.parser')

    if var_headers.get():
        for i in range(1, 7):
            for tag in soup.find_all(f'h{i}'):
                tag['style'] = "text-align: left;"

    if var_lists.get():
        for tag in soup.find_all(['ol', 'ul']):
            tag['style'] = "text-align: left;"

    if var_blockquotes.get():
        for tag in soup.find_all('blockquote'):
            tag.insert_before(soup.new_tag('p'))
            tag.insert_after(soup.new_tag('p'))

    modified_html = str(soup)

    if var_whitespace.get():
        modified_html = re.sub(r'>\s+<', '><', modified_html)

    if var_paragraph_space.get():
        modified_html = re.sub(r'<p>', '<p>&nbsp;', modified_html)

    if var_line_breaks.get():
        modified_html += '<p><br /></p><p><br /></p>'

    with open(output_file, 'w', encoding='utf-8') as html_out:
        html_out.write(modified_html)

    status_label.config(text="Conversión completada")

# Crear la ventana principal
root = tk.Tk()
root.title("Conversor de Markdown a HTML para Blogger")

# Crear y colocar widgets
input_label = tk.Label(root, text="Archivo de entrada (.md):")
input_label.grid(row=0, column=0, sticky="w", padx=5, pady=5)
input_entry = tk.Entry(root, width=50)
input_entry.grid(row=0, column=1, padx=5, pady=5)
input_button = tk.Button(root, text="Seleccionar", command=select_input_file)
input_button.grid(row=0, column=2, padx=5, pady=5)

output_label = tk.Label(root, text="Archivo de salida (.html):")
output_label.grid(row=1, column=0, sticky="w", padx=5, pady=5)
output_entry = tk.Entry(root, width=50)
output_entry.grid(row=1, column=1, padx=5, pady=5)
output_button = tk.Button(root, text="Seleccionar", command=select_output_file)
output_button.grid(row=1, column=2, padx=5, pady=5)

# Variables para las casillas de verificación
var_headers = tk.BooleanVar(value=True)
var_lists = tk.BooleanVar(value=True)
var_blockquotes = tk.BooleanVar(value=True)
var_whitespace = tk.BooleanVar(value=True)
var_paragraph_space = tk.BooleanVar(value=True)
var_line_breaks = tk.BooleanVar(value=True)

# Crear y colocar casillas de verificación
tk.Checkbutton(root, text="Modificar los encabezados añadiendo el estilo text-align: left", variable=var_headers).grid(row=2, column=0, columnspan=3, sticky="w", padx=5, pady=2)
tk.Checkbutton(root, text="Modificar las listas ordenadas y no ordenadas añadiendo el estilo text-align: left", variable=var_lists).grid(row=3, column=0, columnspan=3, sticky="w", padx=5, pady=2)
tk.Checkbutton(root, text="Agregar párrafos vacíos solo antes y después de los blockquotes", variable=var_blockquotes).grid(row=4, column=0, columnspan=3, sticky="w", padx=5, pady=2)
tk.Checkbutton(root, text="Eliminar espacios en blanco entre etiquetas para que sea un código continuo", variable=var_whitespace).grid(row=5, column=0, columnspan=3, sticky="w", padx=5, pady=2)
tk.Checkbutton(root, text="Agregar un espacio no separable al principio de cada párrafo", variable=var_paragraph_space).grid(row=6, column=0, columnspan=3, sticky="w", padx=5, pady=2)
tk.Checkbutton(root, text="Agregar dos saltos de línea al final del contenido", variable=var_line_breaks).grid(row=7, column=0, columnspan=3, sticky="w", padx=5, pady=2)

# Añadir caja de texto para el formato de la caja de código
code_box_label = tk.Label(root, text="Formato de caja de código:")
code_box_label.grid(row=10, column=0, sticky="w", padx=5, pady=5)
code_box_entry = tk.Entry(root, width=50)
code_box_entry.grid(row=10, column=1, padx=5, pady=5)
code_box_entry.insert(0, config["code_box"])

# Botón para guardar la configuración
save_button = tk.Button(root, text="Guardar configuración", command=save_config)
save_button.grid(row=10, column=2, padx=5, pady=5)

convert_button = tk.Button(root, text="Convertir", command=convert_markdown_to_blogger)
convert_button.grid(row=11, column=1, pady=10)

status_label = tk.Label(root, text="")
status_label.grid(row=12, column=0, columnspan=3, pady=5)

root.mainloop()
