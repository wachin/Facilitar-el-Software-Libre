
Login Manager in MX Linux 21 lightdm, en AV Linux usar este

desinstalar:

sudo apt remove slim

y este desinstala

mxde-slim-themes


sudo apt install lightdm lightdm-modified-init lightdm-gtk-greeter-mx21 lightdm-gtk-greeter-settings

también es necesario el wallpaper de MX

mx21-artwork

Cambiar el login manager en AV Linux

primero en un ordenador o un live USB copiar los archivos de MX Linux 21 que están en:

/etc/lightdm/mx21
/etc/lightdm/keys.conf
/etc/lightdm/lightdm.conf
/etc/lightdm/lightdm-gtk-greeter.conf
/etc/lightdm/users.conf

pegarlos en un pendrive, instalar los paquetes anteriormente mencionados de lightdm en MX Linux 21, configurar lightdm para que sea el principal

en AV Linux se usa

slim

hay que instalar lightdm y luego desinstalar slim

RECOMENDADO
Ver:

Personalizar y configurar lightdm
https://geekland.eu/personalizar-y-configurar-lightdm/

CONSULTAS

How do I set user background for lightDM login screen?
https://askubuntu.com/questions/1405947/how-do-i-set-user-background-for-lightdm-login-screen


# Programas faltantes


system-config-printer 
