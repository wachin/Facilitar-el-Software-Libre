## Se puede usar el siguiente script para sincronizar un repositorio con push

Primo debo explicar que esto para es un unico usuario que esté usando un repositorio de github y que con git add . git commit -m update git push sincronice el repositorio. Para ahorrar hacer todos esos pasos uso el siguiente script llamado:

auto-push-script.sh

que contiene:

```
#!/bin/bash

### Auto push script

echo "Agregando cambios al stage..."
git add .
echo "Realizando commit..."
git commit -m "Actualización $(date)"
echo "Enviando cambios al repositorio remoto..."
git push origin main
echo "Proceso finalizado."
read
```

para usarlo antes yo abría una terminal en carpeta donde estaba (claro que ya le había dado permisos de ejecución con clic derecho y en la pestaña permisos marcarlo) y escribía el comando para ejecutarlo:

./auto-push-script.sh

pero me quiero ahorrar esos pasos, entonces estoy usando nnn

## Ejecutando script bash en nnn con Ctrl + O escribiendo bash

Estoy usando en linux en la terminal el administrador de archivos nnn (es un administrador de archivos de línea de comandos

**Instalar nnn**

```
sudo apt install nnn
```

**Nota:** nnn también se puede usar en Android con Termux.

Y quiero que ejecute uno archivo .sh el cual es un script que tengo, para ejecutarlo con nnn hago lo siguiente, primero ejecuto en la terminal nnn y se abre y allí busco el script sh:

auto-push-script.sh  

y en nnn me pongo encima del script y aplasto **Ctrl + O** y me pregunta: "**open with**" y yo escribo: "**bash**" y doy enter y me pregunta: **"c" li "g"ui?** y le pongo **c** y se ejecuta allí, y todo bien. Pero yo quiero que se ejecute con menos pasos

## Creando un plugin para nnn para ejecutar script bash

Primero instalar todos los plugins de nnn, ponga en la terminal:

```
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
```

estas mismas instrucciones están en (puede verlas allí o directamente desde allí seguirlas):

[https://github.com/jarun/nnn/tree/master/plugins#installation](https://github.com/jarun/nnn/tree/master/plugins#installation)

## Plugin execonbash

Para que `nnn` ejecute con menos pasos los scripts `.sh` con `bash` al presionar Enter, debemos crear el plugin y configurar un atajo de acción que cargue el archivo de configuración de `nnn`. los siguientes son los pasos:

1.) **Crear el archivo de configuración de nnn**: créalo en tu directorio home poniendo en la terminal:

```
nano ~/.config/nnn/plugins/execonbash
```

Si no sabe cómo usar nano vea esta entrada: [https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html)

2.) Allí añadir el script para ejecutar archivos `.sh` : Copia y pega el siguiente contenido en el archivo:

```
#!/bin/bash

# Si el archivo tiene la extensión .sh, ejecútalo con bash
if [[ "$1" == *.sh ]]; then
    bash "$1"
fi
```

Guarda y cierra el archivo.

3.) **Dar permisos de ejecución**:

```
chmod +x ~/.config/nnn/plugins/execonbash
```

4.1.) **Configurar bash para usar los plugins** (no funciona en mi ordenador Linux):
Según el tutotial en:

[https://github.com/jarun/nnn/tree/master/plugins#configuration](https://github.com/jarun/nnn/tree/master/plugins#configuration)

pone un ejemplo para habilitar varios scripts:

```
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
```

**Nota**: Si ustedes usan zsh u otro deberán añadirlo al archivo de configuración de aquel.

pero yo no voy a usar todos esos sino solo los siguientes incluyendo el que he creado:

```
export NNN_PLUG='f:finder;o:execonbash;p:launch;v:imgview'
```

**Añadir permanentemente las configuraciones de los plugins en bash**
Debemos de añadir al archivo:

.bashrc

está oculto en HOME, para verlo Ctrl + H en su administrador de archivos

Cerrar sesión y volver a entrar. 

**Usar nuestro plugin**: Ahora, cuando estés en `nnn` y te posiciones sobre un script `.sh`, simplemente presiona `;` y la tecla `o`  que en mi caso para hacer eso tengo que presionar:

Shift derecho + ;

entonces deberá aparecer abajo a la izquierda de nnn lo siguiente:

keys: f o p v

esto significa que están habilitadas esas teclas para los plugins:

f finder

o execonbash

p launch

v imgview

y al aplastar la tecla **o** se activará ejecutandose el script

Pero esto no funciona en mi Linux Debian 12 de 32 bit, si en el suyo funciona adelante, sino:

## Para que el plugin funcione en Debian 12, uso un lanzador de terminal
Para crear un lanzador de terminal estoy usando la terminal Konsole y el administrador de archivos Dolphin, y he creado el siguiente script llamdo:

Script_nnn_open_auto-push-script.sh

a este le he dado permisos de ejecución con clic derecho, en la pestaña permisos, marcarlo. Este script contiene lo siguiente:

```
#!/bin/bash

export NNN_PLUG='f:finder;o:execonbash;p:launch;v:imgview'

konsole -p tabtitle='PFSLE' -e nnn "auto-push-script.sh"

# export NNN_PLUG='f:finder;o:execonbash;p:launch;v:imgview'

# Este comando define una variable de entorno llamada NNN_PLUG que configura los plugins disponibles para el administrador de archivos de línea de comandos nnn. Los plugins son funciones adicionales que extienden las capacidades de nnn. Al exportar esta variable en tu archivo ~/.bashrc o en el script que lance nnn, haces que estos plugins estén disponibles

# export: Este comando establece una variable de entorno que estará disponible para todos los programas que se ejecuten en la sesión actual de la terminal.

# NNN_PLUG: Es la variable de entorno específica de nnn que se utiliza para definir y configurar los plugins.

# 'f:finder;o:execonbash;p:launch;v:imgview': Esta es la lista de plugins que se están configurando. Cada plugin se define con un par de valores separados por dos puntos (:), donde el primer valor es la tecla que activará el plugin y el segundo es el nombre del plugin. Los plugins en la lista son:

# f:finder: Asocia la tecla f con el plugin finder. Este plugin generalmente se utiliza para buscar archivos o directorios de manera interactiva.

# o:execonbash: Asocia la tecla o con el plugin execonbash. Este plugin se usa para ejecutar comandos en bash desde nnn.

# p:launch: Asocia la tecla p con el plugin launch. Este plugin se utiliza para lanzar archivos o aplicaciones según su tipo.

# v:imgview: Asocia la tecla v con el plugin imgview. Este plugin se utiliza para ver imágenes dentro de nnn.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# konsole -p tabtitle='PFSLE' -e nnn "auto-push-script.sh"

# Este comando ejecuta el terminal konsole con opciones específicas para abrir una nueva pestaña con un título personalizado y ejecutar un archivo de script utilizando el administrador de archivos nnn. Aquí está el desglose de cada parte del comando:

# konsole: Es el emulador de terminal predeterminado para el entorno de escritorio KDE en Linux.

# -p tabtitle='PFSLE': Esta opción establece el título de la pestaña en PFSLE. La opción -p permite pasar propiedades personalizadas a konsole. En este caso, la propiedad tabtitle se utiliza para cambiar el título de la pestaña.

# -e nnn "auto-push-script.sh": La opción -e especifica el comando que se ejecutará dentro de la terminal konsole. Aquí, se está utilizando nnn, que es un administrador de archivos de línea de comandos, para abrir el archivo de script auto-push-script.sh. Al abrir el archivo en nnn, puedes navegar por el archivo o ejecutarlo, pero en este caso usaremos el atajo de teclado "Shift + ;" para escribir ; y que se muestren las opciones keys: f o p y con lo cual presionaremos o para que se ejecute el script.
```

Lo que sirve son las primeras tres línea de código, el resto son explicaciones de qué es lo que hace. 

Para que este script funcione al lado debe estar el otro script llamado:

auto-push-script.sh

ejemplo yo los uso en mi repositorio:

```
.
├── auto-push-script.sh
├── Categorías
├── LICENSE
├── README.md
├── Script_nnn_open_auto-push-script.sh
├── README.md
└── Tutoriales
```

que lo puede ver en:

[https://github.com/wachin/Facilitar-el-Software-Libre](https://github.com/wachin/Facilitar-el-Software-Libre)

Para usarlo simplemente en Dolphin le doy doble clic al script:

Script_nnn_open_auto-push-script.sh

y se abre una ventana de Konsole que pregunta:

```
+------------------------------------+
| Dolphin                            |
+------------------------------------+
| ¿Qué desea hacer con este archivo? |
|                                    |
|  [ ] No volver a preguntar         |
|  [Abrir] [Ejecutar] [Cancelar]     |
|                                    |
+------------------------------------+
```

de clic en el botón "Ejecutar" y se abre una ventana de Konsole donde está seleccionado el script: **auto-push-script.sh** y presiono el atajo de teclado: "**Shift + ;**" para que se ejecute "**;**" y aparece abajo a la izquierda en nnn:

keys: f o p v 

y presiono la tecla **o** y se ejecuta el script

## Si en Dolphin configura la ejecución automática de los script ya no funciona, ¿qué hacer?

Si al darle doble clic al script (o a otro script):

Script_nnn_open_auto-push-script.sh

al aparecerle la ventana que pregunta:

```
+------------------------------------+
| Dolphin                            |
+------------------------------------+
| ¿Qué desea hacer con este archivo? |
|                                    |
|  [x] No volver a preguntar         |
|  [Abrir] [Ejecutar] [Cancelar]     |
|                                    |
+------------------------------------+
```

si usted marca:

**[ x ] No volver a preguntar**

y le da clic a:

**Ejecutar**

después al darle doble clic al script  "**Script_nnn_open_auto-push-script.sh**" ya no aparecerá la ventana que preguntaba si deseaba ejecutar el script y no funcionará en nnn la muestra de los plugins (desconozco porqué y si en alguna otra version de Dolphin funcione)

Para que Dolphin (en Debian 12 la versión 22.12 -es posible que sirva para otra versiones pero vea donde están las opciones-) vuelva a preguntarte si deseas ejecutar un script haga lo siguiente:

- Abre **Dolphin**.
- Accede a las preferencias: Ve a **Ajustes > Configurar Dolphin....**
- Selecciona la pestaña "**General**" en la ventana de configuración.
- Busca la sección "**Confirmaciones**" allí en "**Abrir un archivo ejecutable**" abre la ventanita y selecciona: "**Preguntar siempre**"

Que Dios les bendiga



