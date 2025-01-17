# How to integrate Java OpenJDK with right-click in file managers

https://askubuntu.com/questions/114990/lost-right-click-open-with-java-jar-file/1524832#1524832

I'm using Debian 12 (this tutorial should work on Debian-based Linux operating systems and maybe others - or with modifications). I have installed Java with `sudo apt install default-jre`, and to launch Java applications, I use the terminal, for example: `java -jar myapp.jar`. However, I want to open them with a right-click in file managers. For this, I need to create a launcher.

![Right-click enabled to open Java app in file manager](https://github.com/wachin/Facilitar-el-Software-Libre/blob/main/Tutoriales/Java/Integrar%20Java%20en%20los%20administradores%20de%20archivos%20con%20clic%20derecho/vx_images/01-Clic-derecho-habilitado-abrir-app-java-en-administrador-de-archivo.png?raw=true)

## Creating the launcher with nano

Enter in the terminal:

```
sudo nano /usr/share/applications/java.desktop
```

Copy the following content:

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

and paste it into nano using "Ctrl + V"

**Saving the file in nano**:
- Press Ctrl + O (Control and O at the same time) to save the changes.
- nano will ask for confirmation of the file name, press Enter to confirm writing to the file: /usr/share/applications/java.desktop

**Note**: Nano abbreviates CTRL with ^, so CTRL + O is equivalent to:

^O

and in nano it appears as:

^O Save

so to save, press:

CTRL + O

and a message will appear saying something like:

File Name to Write: /usr/share/applications/java.desktop

and press ENTER

**Closing nano**:
- Press Ctrl + X (Control and X at the same time) to exit the nano editor.

**Note**: Nano abbreviates CTRL with ^, so CTRL + X is equivalent to:

^X

and in nano it appears as:

^X Exit

which is to Exit

## Papirus icon theme
Additionally, I need to use the icon theme:

Papirus

https://github.com/PapirusDevelopmentTeam/papirus-icon-theme

**Note**: It's available in MX Linux repositories

Install and use it

This theme has Java icons in:

```
/usr/share/icons/Papirus/16x16/apps/java.svg
/usr/share/icons/Papirus/16x16/apps/java.svg
/usr/share/icons/Papirus/22x22/apps/java.svg
/usr/share/icons/Papirus/24x24/apps/java.svg
/usr/share/icons/Papirus/32x32/apps/java.svg
/usr/share/icons/Papirus/48x48/apps/java.svg
/usr/share/icons/Papirus/64x64/apps/java.svg
```

That's why in the java.desktop file, the Icon= line has java. This will enable right-click functionality in file managers.
