
In order to convert your Markdown document to DOCX, use the tool pandoc [3]. Pandoc is a Haskell library, and describes itself as "the universal document converter", or the "Swiss army knife for document conversions". It is available for a variety of platforms such as Linux, Microsoft Windows, Mac OS X, and BSD. Pandoc is commonly included as a package for Linux distributions like Debian GNU/Linux, Ubuntu, and CentOS.

A simple call for a conversion is as follows:

    pandoc -o test.docx test.md

The first parameter `-o` refers to the output file, followed by the name of the file (`test.docx`). The file extension helps pandoc to identify the desired output format. The second parameter names the input file --- in our case it is simply `test.md`.

Entonces sería

md a docx

    for i in *.md; do pandoc -o "$i" "${i%.*}.mp4"; done


### Lo siguiente es información de conversiones con ffmpeg, a ver si puedo usar lo mismo pero cambiarlo para pandoc

Un sólo comando en bash script para convertir facilmente, reemplace *.mkv con el tipo de archivo que usted tiene y quiere convertir, y mp4 con el resultado que quiere obtener:

avi a mp4

    for i in *.avi; do ffmpeg -i "$i" "${i%.*}.mp4"; done



opus a mp3 
Personalizado, baja calidad, mono 

    for i in *.opus; do ffmpeg -i "$i" -ar 44100 -ac 1 -b:a 48k "${i%.*}.mp3"; done



UN EXPERIMENTO PARA CONVERSION DE MP4 A MP4 SIN USAR OTRA CARPETA, AÑADIENDO FECHA

    for i in *.mp4; do ffmpeg -i "$i" "${i%.*}-$(date '+%Y-%m-%d_%H.%M.%S').mp4"; done


UN EXPERIMENTO PARA CONVERSION DE MP4 A MP4 SIN USAR OTRA CARPETA, AÑADIENDO PREFIJO

    for i in *.mp4; do ffmpeg -i "$i" "${i%.*}-conv.mp4"; done
 
