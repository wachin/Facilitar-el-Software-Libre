Para convertir un archivo Markdown (`.md`) a Word (`.docx`), incluyendo imágenes, con **Pandoc**, sigue estos pasos:

### **1. Instalar Pandoc (si aún no lo tienes)**
- **Windows**: Descarga el instalador desde [pandoc.org](https://pandoc.org/installing.html).
- **Linux**: Usa el gestor de paquetes de tu distribución, por ejemplo:
  ```sh
  sudo apt install pandoc  # Ubuntu/Debian
  sudo dnf install pandoc  # Fedora
  ```
- **Mac**: Instálalo con Homebrew:
  ```sh
  brew install pandoc
  ```

### **2. Asegurar que las imágenes están bien referenciadas**
- Las imágenes deben estar referenciadas correctamente en el Markdown usando la sintaxis estándar:
  ```md
  ![Texto alternativo](ruta/imagen.png)
  ```
- Si las imágenes están en un subdirectorio, usa rutas relativas.

### **3. Convertir el Markdown a Word con imágenes**
Ejecuta este comando en la terminal:
```sh
pandoc archivo.md -o archivo.docx
```
Esto generará un archivo `.docx` con formato básico.

### **4. Incluir imágenes correctamente**
Si las imágenes no aparecen en el Word generado, prueba empaquetando el contenido en un solo directorio antes de la conversión:
```sh
pandoc archivo.md --resource-path=directorio-de-imagenes -o archivo.docx
```
O bien, usa:
```sh
pandoc archivo.md --extract-media=./imagenes -o archivo.docx
```
Esto extraerá las imágenes y las insertará en el documento de Word.

### **5. Personalizar la Conversión**
Si quieres un mejor formato, puedes agregar una plantilla de Word personalizada:
```sh
pandoc archivo.md --reference-doc=plantilla.docx -o archivo.docx
```
Puedes generar una plantilla editable con:
```sh
pandoc --print-default-data-file reference.docx > plantilla.docx
```
Luego edítala en Word y úsala para futuras conversiones.

### **Conclusión**
Estos pasos deberían permitirte convertir archivos Markdown a Word con imágenes sin problemas. 🚀
