# Ayuda de nnn file manager 

Para acceder a la ayuda de nnn, una vez ejecutado este en una terminal

nnn

en el teclado hay que poner:

?

pero antes explico que en este tutorial se abrevia CTRL con ^, así ejemplo CTRL + ] es igual a:

^]

ahora si vamos con la ayuda:

---

**NAVEGACIÓN**
```
   Up    k     Arriba            
   Dn    j     Abajo             
   Lt    h     Dir principal     
Ret Rt   l     Abrir                   
   g    ^A     Parte superior          
   G    ^E     Parte final             
   b    ^/     Clave de marcador (Bookmark key)           
   1-4         Contexto 1-4       
  Esc          Enviar a FIFO           
   Q           Seleccionar/error, salir         
   q           Salir del contexto      
   ?           Ayuda, configuración            
PgUp   ^U      Desplazarse hacia arriba
PgDn   ^D      Desplazarse hacia abajo
  ~ ` @  -     HOME, /, comienzo, último
   '           Primer archivo/empate
   .           Alternar archivos ocultos
   +           Alternar avance automático
   ,           Marcar directorio de trabajo actual (CWD)
(Sh) Tab       Cambiar de contexto
  ^L           Redibujar
  ^G           Salir de CD
2Esc  ^Q       Salir
```

**FILTRO & PROMPT**
```
   /           Filtro                   
 Alt+Esc       Limpiar filtro y redibujar
   Esc         Salir del prompt       
  ^L           Limpiar prompt/último filtro
  ^N           Alternar navegación por tipo
```

**ARCHIVOS**
```
  o ^O         Abrir con...            
   n           Crear nuevo/enlace
  f ^F         Detalles del archivo    
   d           Alternar modo de detalle
  ^R           Renombrar/duplicar      
   r           Renombrado en lote
   z           Comprimir                
   e           Editar archivo
   *           Alternar ejecutable     
   >           Exportar lista
Space ^J       (Des)seleccionar        
 m ^Space      Marcar rango/borrar selección
   p ^P        Copiar selección aquí   
   a           Seleccionar todo
 v ^V          Mover selección aquí    
 w ^W          Copiar/mover selección como
   x ^X        Eliminar                
   E           Editar selección
```

**MISC**
```
Alt ;          Seleccionar plugin      
   =           Lanzar aplicación
  ! ^]         Consola                
   ]           Prompt de comando (cambiar a la terminal)
   c           Conectar remoto        
   u           Desmontar remoto/archivo comprimido
   t ^T        Alternar opciones de ordenamiento
   s           Administrar sesión
   T           Establecer tipo de tiempo
   0           Bloquear
``` 

--- 

Espero que esto te sea de ayuda para manejar mejor `nnn`. 

https://github.com/jarun/nnn