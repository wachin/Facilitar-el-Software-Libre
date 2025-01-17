

Tengo el repositorio:

RisenPC-Fluxbox-ES

y por error lo copie así mismo dentro de el mismo, entonces hice add . y me apareció esto:

wachin@mx21:~/RisenPC-Fluxbox-ES
$ git add .
warning: agregando repositorio embebido: RisenPC-Fluxbox-ES
ayuda: You've added another git repository inside your current repository.
ayuda: Clones of the outer repository will not contain the contents of
ayuda: the embedded repository and will not know how to obtain it.
ayuda: If you meant to add a submodule, use:
ayuda: 
ayuda: 	git submodule add <url> RisenPC-Fluxbox-ES
ayuda: 
ayuda: If you added this path by mistake, you can remove it from the
ayuda: index with:
ayuda: 
ayuda: 	git rm --cached RisenPC-Fluxbox-ES
ayuda: 
ayuda: See "git help submodule" for more information.
wachin@mx21:~/RisenPC-Fluxbox-ES


Entonces mi solución es como dice allí esta:

    git rm --cached RisenPC-Fluxbox-ES


git reset 
