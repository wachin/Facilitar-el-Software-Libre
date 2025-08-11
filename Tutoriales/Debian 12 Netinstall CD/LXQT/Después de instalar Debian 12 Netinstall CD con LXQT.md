# **Cómo instalar Debian 12 Netinstall CD con LXQT**

Estos son los pasos para dejar utilizable a LXQT instalado desde Netinstall CD, del cual he hecho un tutorial general:

Cómo instalar Debian NetInstall CD
https://github.com/wachin/Como-instalar-Debian-12-NetInstall-CD 

y allí en la instalación seleccionar sólo LXQT y las herramientas de Debian nada más


## Fix `Username Is Not In The Sudoers File. This Incident Will Be Reported` On Debian 

Los Sistema Operativos Debian no vienen configurados para elevar los permisos con:

sudo

esto es así porque es un sistema operativo dirigido a usuarios avanzados, y por otras razones está configurado así.

**SOLUCIÓN**

Ponga en la terminal:

```bash
su -
```

y ponga su contraseña de super usuario, la que usó cuando instaló el Sistema Operativo Debian Netinstall CD (no me refiero a la contraseña de usuario)

Y luego, como se ve en el siguiente comando, debe cambiar "usuario" por su usuario:

```bash
usermod -aG sudo usuario
```

Si no sabe cual es el nombre usuario, es el nombre que está a la izquierda de la arroba en la termina. 

En mi caso me debe quedar así:

```bash
usermod -aG sudo wachin
```

ejecutar y luego:

**reiniciar**

y cuando vuelva a poner sudo en la terminal para ejecutar algún comando ejemplo:

sudo apt update

ya le funcionará

**Nota:** Si no reinicia no funciona aunque haga lo que haga.



