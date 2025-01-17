 
#!/bin/bash

# Verifica si se proporcionó un archivo como argumento
if [ $# -eq 0 ]; then
    echo "Por favor, proporciona un archivo Markdown como argumento."
    echo "Uso: $0 archivo.md"
    exit 1
fi

input_file="$1"
output_file="${input_file%.md}.html"

# Convierte Markdown a HTML básico usando pandoc
pandoc "$input_file" -o "$output_file"

# Aplica estilos personalizados
sed -i '
    # Añade estilos a <pre> y <code>
    s|<pre><code class="language-bash">|<pre style="background-color: #f8f8f8; border: 2px solid #ff6600; border-radius: 5px; padding: 10px;"><code style="color: black;">|g
    s|<code>|<code style="background-color: #f8f8f8; border: 1px solid #ff6600; border-radius: 3px; padding: 2px 4px; color: black;">|g

    # Modifica los blockquote
    s|<blockquote>|<blockquote style="background-color: #f8f8f8; border: 1px solid #cccccc; border-radius: 5px; padding: 10px; margin: 10px 0;">|g
    s|<p>|<p style="color: black; margin: 0;">|g
' "$output_file"

echo "Conversión completa. El archivo HTML se ha guardado como $output_file"
