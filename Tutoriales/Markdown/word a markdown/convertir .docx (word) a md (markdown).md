## Convertir .docx (Word) a .md (Markdown)

To save images that are included in a binary container (docx, epub, or odt) - here a Microsoft Word document - to a directory use the following command. This will create a folder images/media. The media is extracted from the container and the original filenames are used


Para guardar imágenes que están incluidas en un contenedor binario (docx, epub u odt), aquí un documento de Microsoft Word, en un directorio, use el siguiente comando. Esto creará una carpeta de imágenes/medios. Los medios se extraen del contenedor y se utilizan los nombres de archivo originales.





```
pandoc --extract-media=images -s mydoc.docx -t markdown -o mddoc.md
```

ODT a md
```
pandoc --extract-media=Pictures -s mydoc.odt -t markdown -o mddoc.md
```


yo wachín cree una carpeta images y allí dentro se crearon las imagenes, y el archivo md tenía las imagenes orientadas allí y funciona, pero debo ver si no es necesario crear esa carpeta

In Word, images files actually live in a folder called "media" inside the docx. So, the "media" folder will always be created. To have a single directory level with the directory "media" only, use the current directory and this command.

```
pandoc --extract-media=. -s mydoc.docx -t markdown -o mddoc.md
```

To use **Github-friendly Markdown** (gfm), we can use:

```
pandoc --extract-media=. -s mydoc.docx -t gfm -o mddoc.md
```


blog.atwork.at | Convert Word documents to Markdown, HTML or any other format
https://blog.atwork.at/post/Convert-documents-with-Pandoc
