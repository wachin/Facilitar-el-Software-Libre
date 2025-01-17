
Sí, es posible usar dos usuarios de GitHub en un mismo sistema Linux. Esto se puede hacer configurando diferentes configuraciones de usuario a nivel de repositorio

### Opción 1: Configuración de usuario por repositorio
Puedes configurar diferentes usuarios para diferentes repositorios en Git usando `git config`.

1. **Configurar el usuario global por defecto - Omite el paso si ya lo tenías**

   Primero, configura el usuario por defecto (global), que se aplicará a todos los repositorios donde no se haya configurado uno específico.

   ```bash
   git config --global user.name "Usuario1"
   git config --global user.email "usuario1@example.com"
   ```

2. **Configurar el usuario para un repositorio específico:**

   Luego, lo que si necesitas es usar un usuario diferente para un repositorio específico, navega hasta el directorio de ese repositorio y configura el usuario local para ese repositorio, desde una terminal haga lo siguietne:

   ```bash
   cd /ruta/del/repositorio
   git config user.name "Usuario2"
   git config user.email "usuario2@example.com"
   ```

Reemplaza con tus datos

Ahora vea los archivos ocultos con Ctrl + H y entre en un administrador de archivos en:

.git

y allí está el archivo:

config

éste ábralo con algún editor de texto y donde está en mi caso me debe quedar así 

[remote "origin"]
	url = https://github.com/tuusuario/Cancionero

y añadiendo el token debe quedar así:

[remote "origin"]
	url = https://tuusuario:eltoken@github.com/tuusuario/Cancionero

	
cierre el archivo.

Además debe editar el archivo:

/home/usuario/.git-credentials

allí debe poner el token así:

https://tuusuario:tutoken@github.com

y guardar el archivo

y luego si todo salió bien hacer git status en tu repositorio de otra cuenta y se podrán hacer los demás comandos, add commit push fetch etc

