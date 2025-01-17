

HEAD desacoplada en git

Detached HEAD en Git
Publicado por Zootropoel 11 agosto 2015	
http://mundogeek.net/archivos/2015/08/11/detached-head-en-git/

Es posible que Git te haya mostrado alguna vez una advertencia del tipo «You are in ‘detached HEAD’ state» al intentar hacer un commit o un push. Lo que nos está diciendo Git es que el puntero HEAD está apuntando directamente a un commit, en lugar de apuntar a una rama que apunte al commit.

Para solucionarlo creamos una nueva rama temporal y hacemos que apunte al último commit haciendo un checkout de ella:

    git branch tmp
    git checkout tmp

Movemos el puntero de la rama master al de nuestra nueva rama temporal:

    git branch -f master tmp
    git checkout master

Borramos la rama temporal, que ya no es necesaria:

    git branch -d tmp

Y ya podemos hacer el commit o el push tranquilamente:

    git push origin master
    
    
    
    
