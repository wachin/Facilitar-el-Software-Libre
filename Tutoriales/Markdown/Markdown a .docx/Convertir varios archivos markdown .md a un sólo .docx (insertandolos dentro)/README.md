# Markdown a .docx/Convertir varios archivos markdown .md a un sólo .docx (insertandolos dentro) 
Ubiquese en una terminal en el lugar donde tenga los archivos y ponga:  

    pandoc -o all-files.docx -f markdown -t docx *.md

este comando convertirá todos los archivos .md a un sólo archivo de Microsoft Office Word dentro del cual estarán todos los textos que antes eran Markdown con su formato en Word


**Basado en:**  
Convert Markdown into a Word Document  
https://mrjoe.uk/convert-markdown-to-word-document/

    pandoc -o output.docx -f markdown -t docx filename.md