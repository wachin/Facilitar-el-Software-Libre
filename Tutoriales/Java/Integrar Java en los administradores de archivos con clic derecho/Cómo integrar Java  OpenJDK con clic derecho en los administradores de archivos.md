Estoy usando Debian 12 (este tutorial debe funcionar en Sistemas Operativos Linux basados en Debian y tal vez otros -o modificandolo-) y he instalado java con sudo apt install default-jre y para lanzar las aplicaciones java pongo en la terminal ejemplo: java -jar miapp.jar pero quiero abrirlas con clic derecho en los administradores de archvios, para eso debo crear un lanzador

![https://github.com/wachin/Facilitar-el-Software-Libre/blob/main/Tutoriales/Java/Integrar%20Java%20en%20los%20administradores%20de%20archivos%20con%20clic%20derecho/vx_images/01-Clic-derecho-habilitado-abrir-app-java-en-administrador-de-archivo.png?raw=true](https://github.com/wachin/Facilitar-el-Software-Libre/blob/main/Tutoriales/Java/Integrar%20Java%20en%20los%20administradores%20de%20archivos%20con%20clic%20derecho/vx_images/01-Clic-derecho-habilitado-abrir-app-java-en-administrador-de-archivo.png?raw=true)


## Creando el lanzador con nano

Poner en la terminal:

```
sudo nano /usr/share/applications/java.desktop
```

copia el siguiente contenido:

```
[Desktop Entry]
Encoding=UTF-8
Name=Java
Comment=Java Virtual Machine
Exec=java -jar
Icon=java
Terminal=false
Type=Application
NoDisplay=true
Categories=Applications;
MimeType=application/x-java-archive;application/x-jar;
```

y pegalo en nano "Ctrl + V"

**Guardar el archivo en nano**:
─ Presiona Ctrl + O (Control y O al mismo tiempo) para guardar los cambios. ─ nano te pedirá confirmación para el nombre del archivo, presiona Enter para confirmar la escritura en el archivo: /usr/share/applications/java.desktop

**Nota**: Nano abrevia CTRL con ^, así CTRL + O es igual a:

^O

y en nano aparece así:

^O Guardar

por eso para guardar aplaste:

CTRL + O

y aparecerá un mensaje que dice algo así:

Nombre del fichero a escribir: /usr/share/applications/java.desktop

y de ENTER

**Cerrar nano**:
─ Presiona Ctrl + X (Control y X al mismo tiempo) para salir del editor nano.

**Nota**: Nano abrevia CTRL con ^, así CTRL + X es igual a:

^X

y en nano apare así:

^X Salir

que es para Salir


## Tema de iconos Papirus
Además debo usar el tema de iconos:

Papirus

https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

**Nota**: Está en los repositorios de MX Linux

Este tema tiene los iconos de java en:

```
/usr/share/icons/Papirus/16x16/apps/java.svg
/usr/share/icons/Papirus/16x16/apps/java.svg
/usr/share/icons/Papirus/22x22/apps/java.svg
/usr/share/icons/Papirus/24x24/apps/java.svg
/usr/share/icons/Papirus/32x32/apps/java.svg
/usr/share/icons/Papirus/48x48/apps/java.svg
/usr/share/icons/Papirus/64x64/apps/java.svg
```

por eso en el archivo java.desktop en la línea Icon= está java. Y así se habilitará el clic derecho en los administradores de archivos

