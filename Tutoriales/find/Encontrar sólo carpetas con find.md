

	find ./ -type d -name "usr" -not -name debian -print0 
	
	find ./ -type d -name "usr" -print0
	
No funcionan:
	
	find -type d -name "usr,opt" -print0
	

Probando:
    
    find . \( -name '*.mp3' -o -name '*.jpg' \) -print
    
    find ./ -type d -name "usr" -print0
    
    
Funciona:

De la siguiente manera:

    find ./ \( -type d -name "usr" -o -type d -name "opt" \) -print

el resultado dado es en forma de lista:

    ./opt
    ./usr

Pero de la siguiente manera:
    
    find ./ \( -type d -name "usr" -o -type d -name "opt" \) -print0

el resultado es seguido:

    ./opt./usr
    
    

el programa lo necesita con lo siguiente al final:

    find ./ \( -type d -name "usr" -o -type d -name "opt" \) -print0 | \

eso es porque el resultado va para otros procesos    
    

UsingFind - Greg's Wiki
http://mywiki.wooledge.org/UsingFind
