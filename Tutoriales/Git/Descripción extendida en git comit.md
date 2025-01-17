Para añadir una descripción extendida en un commit de Git, puedes hacerlo de la siguiente manera:

1. **Comando directo:**
    
    Usa el siguiente comando para hacer un commit:
    
    bash
    
    Copiar código
    
    `git commit -m "Mensaje corto del commit" -m "Descripción extendida del commit con muchos más detalles."`
    
    En este caso, la primera opción `-m` añade el mensaje corto, y la segunda opción `-m` añade la descripción extendida.
    
2. **Abrir el editor de texto:**
    
    Si prefieres usar un editor de texto para escribir tu mensaje de commit:
    
    bash
    
    Copiar código
    
    `git commit`
    
    Esto abrirá tu editor de texto por defecto, donde puedes escribir el mensaje de commit. La primera línea debe ser el mensaje corto, seguido de una línea en blanco, y luego el texto que quieras incluir como descripción extendida. Ejemplo:
    
    css
    
    Copiar código
    
    `Mensaje corto del commit  Aquí va la descripción extendida del commit, donde puedes agregar muchos más detalles sobre los cambios realizados.`
    

Al confirmar y cerrar el editor, el commit se guardará con el mensaje corto y la descripción extendida.
