Converting Multiple Markdown Files into HTML or Other Formats in Linux
https://websetnet.net/converting-multiple-markdown-files-into-html-or-other-formats-in-linux/



    for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done


Ver si le puedo añadir lo siguiente para que sea más exacto

    pandoc file.md -f markdown -t html -s -o file.html


intentandolo:

    for i in *.md ; do echo "$i" && pandoc -s $i -o $i.html ; done

