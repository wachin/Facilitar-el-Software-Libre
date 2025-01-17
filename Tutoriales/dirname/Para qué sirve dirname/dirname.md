
Using Linux Dirname Command in Bash Scripts [Examples]
https://linuxhandbook.com/dirname/

dirname - Wikipedia
https://en.wikipedia.org/wiki/Dirname

Ejemplo de uso:

    pathname="/home/wachin/AppsLinux/RisenPC-Fluxbox-ES/styles"
    result=$(dirname "$pathname")
    echo $result

me da:

    /home/wachin
    
    
Otro ejemplo:

    pathname="/home/wachin/AppsLinux/RisenPC-Fluxbox-ES/styles"
    result=$(dirname "$pathname")
    echo $result
    
me da:

    /home/wachin/AppsLinux/RisenPC-Fluxbox-ES
    
esto significa que me da la ruta hsta la carpeta anterior






wachin@mx21:~
$ dirname --help
Modo de empleo: dirname [OPCIÓN] NOMBRE...
Muestra NOMBRE eliminando las barras finales y la última componente que no sea
una barra; si NOMBRE no tiene /'s, el resultado es '.'  (representando el
directorio actual).

  -z, --zero     termina cada línea de salida con NUL, no con nueva línea

      --help     muestra esta ayuda y finaliza
      --version  informa de la versión y finaliza

Ejemplos:
  dirname /usr/bin/          -> "/usr"
  dirname dir1/str dir2/str  -> "dir1" seguido por "dir2"
  dirname stdio.h            -> "."

ayuda en línea sobre GNU coreutils: <https://www.gnu.org/software/coreutils/>
Report any translation bugs to <https://translationproject.org/team/>
Full documentation <https://www.gnu.org/software/coreutils/dirname>
or available locally via: info '(coreutils) dirname invocation'



