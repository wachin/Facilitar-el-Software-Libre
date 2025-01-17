# Personalizando la terminal de Debian para que el cursor aparezca en la siguiente línea así como en MX Linux 

MX Linux tiene una configuración especial en la terminal, yo necesito hacer lo siguiente

1.) Mantener el prompt de Debian con sus colores por defecto.  

2.) Modificar el prompt para que el cursor aparezca en la línea siguiente no como Debian trae por defecto:  

**Promt de Debian**  

```
usuario@maquina:~$
```

y:  

**Promt de MX Linux**  

```
usuario@maquina:~
$
```

3.) No deseo los colores específicos de MX Linux, sino mantener los colores predeterminados de Debian.  

**El prompt** (o "indicador" en español) es esencialmente la "invitación" que te da la terminal para que introduzcas un comando. Es la parte de la interfaz de línea de comandos que te indica que el sistema está listo para recibir instrucciones.

## La solución
La clave para lograr lo que necesito es añadir un salto de línea (`\n`) en la definición del prompt (PS1) de Debian, manteniendo el resto de la configuración original. Esto se logra modificando la línea PS1 en mi archivo .bashrc.

La siguiente sección antes estaba así en Debian:  

```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```

y ahora está así:  

```
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi
```

Esta modificación:  

​	1.) Mantiene la estructura condicional que Debian usa para determinar si debe usar colores o no.  

​	2.) Añade `\n` justo antes del `\$` en ambas opciones (con y sin color).  

​	3.) Conserva los códigos de color originales de Debian (`\[\033[01;32m\]` para verde y `\[\033[01;34m\]` para azul).  

## Comparación en Meld del después y el antes

A la izquierda el archivo modificado y a la derecha el original:

![](vx_images/20240828-211453-esta-es-la-modificacion.webp)

El resultado es un prompt que:  
- Mantiene los colores predeterminados de Debian.  
- Coloca el cursor (donde escribes los comandos) en la línea siguiente.  

Esta solución cumple con tu requisito de tener una apariencia similar a la de MX Linux (con el cursor en la siguiente línea), pero manteniendo el estilo y los colores característicos de Debian.

## Para qué necesito yo una configuración así como la de MX Linux

Para hacer tutoriales y que la ventana de la terminal no ocupe mucho espacio en ancho  

Dios les bendiga