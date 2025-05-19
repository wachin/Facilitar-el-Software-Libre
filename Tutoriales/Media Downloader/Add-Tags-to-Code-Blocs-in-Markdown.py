# Cuando transformo una pagina web a markdown con https://urltomarkdown.com/ cada caja de código que haya 
# tenido el archivo Markdown será convertida con los respectivos ``` arriba y abajo del comando
# pero para que me sirva a mi esto y poder luego aplicar el fix de .html a .html con "html-fix-GUI.py"
# para que los archivos markdown convertidos a html me sirvan para mi blog en Blogger con sus cajas de codigo
# necesito que la parte de arriba tenga alguna etiqueta ejemplo: "```bash" para que cuando yo use
# pandoc para converti el .md a .html retenga el formato correcto el cual si pueda ser convertido por: "html-fix-GUI.py"
# Copyright: Washington Indacochea

import tkinter as tk
from tkinter import filedialog, ttk, messagebox
import re

# Etiquetas disponibles
LANGUAGES = ["bash", "python", "html", "plaintext"]

def process_markdown(content, selected_lang):
    # Reemplazar todos los bloques de código sin etiqueta por ```lang...
    pattern = r"```(?:\n|.*\n)([\s\S]*?)```"

    def replace_block(match):
        code_content = match.group(1).strip()
        return f"```{selected_lang}\n{code_content}\n```"

    new_content = re.sub(pattern, replace_block, content)
    return new_content

def open_file():
    file_path = filedialog.askopenfilename(filetypes=[("Markdown files", "*.md")])
    if not file_path:
        return
    entry_file.delete(0, tk.END)
    entry_file.insert(0, file_path)

def process_file():
    file_path = entry_file.get()
    selected_lang = combo_lang.get()

    if not file_path or not file_path.endswith(".md"):
        messagebox.showwarning("Entrada inválida", "Por favor selecciona un archivo .md válido.")
        return

    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo leer el archivo:\n{e}")
        return

    processed_content = process_markdown(content, selected_lang)

    output_path = file_path.replace(".md", "-taged.md")

    try:
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(processed_content)
        messagebox.showinfo("Éxito", f"Archivo guardado como:\n{output_path}")
    except Exception as e:
        messagebox.showerror("Error", f"No se pudo guardar el archivo:\n{e}")

# Crear la ventana principal
root = tk.Tk()
root.title("Etiquetador de Bloques de Código Markdown")
root.geometry("500x200")
root.resizable(False, False)

# Campo para mostrar la ruta del archivo
entry_file = tk.Entry(root, width=40)
entry_file.pack(pady=20)

# Botón para buscar archivo
btn_browse = tk.Button(root, text="Buscar Archivo .md", command=open_file)
btn_browse.pack()

# Combobox para elegir el lenguaje
combo_lang = ttk.Combobox(root, values=LANGUAGES, state="readonly")
combo_lang.set("bash")
combo_lang.pack(pady=10)

# Botón para procesar
btn_process = tk.Button(root, text="Procesar", command=process_file)
btn_process.pack()

# Iniciar interfaz
root.mainloop()
