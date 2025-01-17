Ayuda de nnn file manager 

Para acceder a la ayuda de nnn, una vez ejecutado este en una terminal

nnn

en el teclado hay que poner:

?

pero antes explico que en este tutorial se abrevia CTRL con ^, así ejemplo CTRL + ] es igual a:

^]

ahora si vamos con la ayuda:

 NAVEGACIÓN
         Up  k  Arriba            
         Dn  j  Abajo             
         Lt  h  Dir principal     
     Ret Rt  l  Abrir                   
         g  ^A  Parte superior          
         G  ^E  Parte Final             
         b  ^/  Bookmark key            
           1-4  Context 1-4       
           Esc  Send to FIFO           
             Q  Pick/err, quit         
             q  Quit context      
             ?  Help, conf            
      PgUp  ^U  Desplazarse hacia arriba
      PgDn  ^D  Desplazarse hacia abajo
      ~ ` @  -  HOME, /, comienzo, último
             '  First file/match
             .  Alternar archivos ocultos
             +  Toggle auto-advance
             ,  Mark CWD
      (Sh) Tab  Cycle context
            ^L  Redraw
            ^G  QuitCD
      2Esc  ^Q  Quit
      

 FILTRO & PROMPT
            /  Filtro            Alt+Esc  Clear filter & redraw
          Esc  Salir del prompt       ^L  Clear prompt/last filter
           ^N  Toggle type-to-nav 
 FILES
         o ^O  Open with...            n  Create new/link
         f ^F  File details            d  Detail mode toggle
           ^R  Rename/dup              r  Batch rename
            z  Archive                 e  Edit file
            *  Toggle exe              >  Export list
     Space ^J  (Un)select       m ^Space  Mark range/clear sel
         p ^P  Copy sel here           a  Select all
         v ^V  Move sel here        w ^W  Cp/mv sel as
         x ^X  Delete                  E  Edit sel
 MISC
        Alt ;  Select plugin           =  Launch app
         ! ^]  Shell                   ]  Cmd prompt (cambiar a modo terminal)
            c  Connect remote          u  Unmount remote/archive
         t ^T  Sort toggles            s  Manage session
            T  Set time type           0  Lock


https://github.com/jarun/nnn
