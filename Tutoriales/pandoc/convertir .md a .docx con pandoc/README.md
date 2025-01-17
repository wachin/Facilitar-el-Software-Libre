
# convertir .md a .dot con pandoc


instalar

sudo apt install pandoc

luego poner en la terminal


    pandoc archivo_entrada.md -o archivo_salida.odt

    pandoc README.md -o README.odt


    pandoc "Lectura critica - Hermenéutica II Washington.md" -o "Lectura critica - Hermenéutica II Washington.docx"

    pandoc "Vocabulario_Washington.md" -o "Vocabulario_Washington.pdf"

ahora hay que abrir el archivo con LibreOffice para que se carguen las imagenes


Markdown to Word/PDF converter for Linux - Super User
https://superuser.com/a/1203099


Yo uso pandoc en Linux para hacer conversiones de archivos de markdown .md a LibreOffice Writer .odt y desde la terminal uso:

    pandoc archivo_entrada.md -o archivo_salida.odt

y pregunto si me puedes hacer el código en python para una interfaz gráfica que tenga un botón para buscar mi archivo markdown de entrada y un botón buscar el lugar donde se convertirá el archivo, además un botón para darle Ejecutar

