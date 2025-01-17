# Añadir a Dolphin una opción /menú para ejecutar / lanzar scripts Python (Debian 12)

> https://facilitarelsoftwarelibre.blogspot.com/2024/08/anadir-dolphin-una-opcion-para-ejecutar-scrpts-en-python.html

[Ir al contenido principal](https://facilitarelsoftwarelibre.blogspot.com/2024/08/anadir-dolphin-una-opcion-para-ejecutar-scrpts-en-python.html#main)


Publicadas por [Washington Indacochea Delgado](https://www.blogger.com/profile/17773143494819856315 "author profile")  [agosto 22, 2024](https://facilitarelsoftwarelibre.blogspot.com/2024/08/anadir-dolphin-una-opcion-para-ejecutar-scrpts-en-python.html "permanent link")

[![Image 15](https://blogger.googleusercontent.com/img/a/AVvXsEjnyUMwiZlyr5jSMkwFczXO1NnPJn9qe3FCvIIPeLmiexxuG__OIFBAwXwbTw08OMl7OsbaEmljpbfVPO5lJLGqj3WdtYOuhsDWsVw_yMF-YGnL_fc6M-IRs5mqde5ERxeyRmvQMsK3uxwvJdPpmhOv1gl22CZjY7kCoq4uCvTRBAkQH3qajzgK2jHJcsg=s16000-rw)](https://blogger.googleusercontent.com/img/a/AVvXsEjnyUMwiZlyr5jSMkwFczXO1NnPJn9qe3FCvIIPeLmiexxuG__OIFBAwXwbTw08OMl7OsbaEmljpbfVPO5lJLGqj3WdtYOuhsDWsVw_yMF-YGnL_fc6M-IRs5mqde5ERxeyRmvQMsK3uxwvJdPpmhOv1gl22CZjY7kCoq4uCvTRBAkQH3qajzgK2jHJcsg)

  
  

Estoy usando unos programas con interfaz grafica que he creado, son sencillos script en python con tkinter y los lanzo ejemplo así:

```
python3 mi_script.py
```

Dependencias
------------

se necesita:

  

```
sudo apt install libkf5kdelibs4support5-bin
```

  

Instalación
-----------

1.) Primero, verifica dónde debes instalar el script:

```
kf5-config --path services
```

Esto te mostrará las rutas donde puedes instalar servicios. Usa la ruta de usuario, generalmente:

```
mkdir -p ~/.local/share/kservices5/ServiceMenus
```

2.) Crea el archivo:

```
nano ~/.local/share/kservices5/ServiceMenus/run_python_script.desktop
```

Si no save cómo usar nano vea el siguiente tutorial:

[Cómo usar nano en la terminal de Linux para editar archivos de texto](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html)

3.) Copia y pega el siguiente contenido:

```
[Desktop Entry]
ServiceTypes=KonqPopupMenu/Plugin,application/x-python,text/x-python
Actions=RunPythonScript
Type=Service
X-KDE-Priority=TopLevel

[Desktop Action RunPythonScript]
Name=Run Python Script
Icon=python
Exec=python3 %f
```

4.) Guarda el archivo (en nano: Ctrl+O para escribir en el archivo, luego Enter para confirmar escribir en el archivo, luego Ctr + X para salir)

5.) Establece los permisos correctos:

```
chmod 644 ~/.local/share/kservices5/ServiceMenus/run_python_script.desktop
```

O también puede establecer el permiso de ejecución con clic derecho \> Propiedades \> pestaña permisos.

Explicación de cada línea del archivo .desktop
----------------------------------------------

La primera linea:

```
[Desktop Entry]
```

Indica el inicio de la entrada del escritorio.

```
ServiceTypes=KonqPopupMenu/Plugin,application/x-python,text/x-python
```

Define los tipos de servicio y [MIME](https://facilitarelsoftwarelibre.blogspot.com/2024/05/que-son-los-archivos-mime-type-en-linux.html) a los que se aplica este menú.

```
Actions=RunPythonScript
```

Especifica el nombre de la acción que se definirá más adelante.

```
Type=Service
```

Indica que esto es un servicio.

```
X-KDE-Priority=TopLevel
```

Establece la prioridad del menú en el nivel superior.

```
[Desktop Action RunPythonScript]
```

Comienza la definición de la acción "RunPythonScript".

```
Name=Run Python Script
```

El nombre que aparecerá en el menú contextual.

```
Icon=python
```

El icono que se mostrará junto a la opción del menú, que funciona con el tema de iconos Papirus.

```
Exec=python3 %f
```

El comando que se ejecutará. %f representa el archivo seleccionado.

Uso:
----

1.  Haz clic derecho en un archivo .py en Dolphin.
2.  Verás la opción "Run Python Script" en el menú contextual.
3.  Haz clic en esta opción para ejecutar el script.

Sobre el icono:
---------------

Para que el icono funcione correctamente, se necesita el tema de iconos Papirus. Si usas MX Linux debe estar pre instalado, pero sino puedes instalarlo con:

```
sudo apt install papirus-icon-theme
```

Si usa Debian si desea puede [instalar los repositorios de MX Linux](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html) pues allí está.

Para las demás distribuciones ver:

[https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/)

Este tema proporciona iconos de Python en varios tamaños en las siguientes rutas:

/usr/share/icons/Papirus/16x16/apps/python.svg  
/usr/share/icons/Papirus/22x22/apps/python.svg  
/usr/share/icons/Papirus/24x24/apps/python.svg  
/usr/share/icons/Papirus/32x32/apps/python.svg  
/usr/share/icons/Papirus/48x48/apps/python.svg  
/usr/share/icons/Papirus/64x64/apps/python.svg  
/usr/share/icons/Papirus/96x96/apps/python.svg  
/usr/share/icons/Papirus/128x128/apps/python.svg

Y debes seleccionar en tu distribución Linux el usar Papirus como el tema de iconos.

Si usas Fluxbox u otro x11 Gestor de ventanas debes usar **qt5ct** y en la pestaña "tema de iconos" elegirlo y **Aplicar** y **Aceptar**.

Después de la instalación, reinicia Dolphin o cierra sesión y vuelve a iniciar para que los cambios surtan efecto.

Dios les bendiga

[Dolphin](https://facilitarelsoftwarelibre.blogspot.com/search/label/Dolphin) [python](https://facilitarelsoftwarelibre.blogspot.com/search/label/python)

