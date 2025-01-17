# Cómo instalar WinRar en PlayOnLinux

Descarga WinRar desde:

https://www.winrar.es/descargas

en la parte de la izquierda están las versiones de 64 bit y en la derecha de 32 bit

### Paso 1: Instalar PlayOnLinux

Primero, necesitas instalar PlayOnLinux. Abre una terminal y ejecuta los siguientes comandos:

```bash
sudo apt update
sudo apt install playonlinux
```
Pero de todos modos consulte en algún buscador para su Linux como se instala

### Paso 2: Configurar PlayOnLinux

Abre PlayOnLinux desde el menú de aplicaciones o usando el siguiente comando en la terminal:

```bash
playonlinux
```
o busquelo desde sus aplicaciones

### Paso 3: Instalar una versión de Wine dentro de  PlayOnLinux
En su sistema operativo Linux debe usted de instalar una version de Wine, para saber cual ejemplo use Synaptic y allí busque la versión de Wine que el sistema tiene instalado (al instalar PlayOnLinux se instala Wine también pero una unica versión para el Sistema Operativo) y dependiendo de esa versión instale una versión de Wine en PlayOnLinux

En PlayOnLinux en la ventana principal vaya a:

**Herramientas / Gestiona versiones de Wine**

y allí instale una sea de 32 o 64 bit

### Paso 4: Instalar WinRAR

1.) En la ventana de PlayOnLinux, haz clic en **"Instalar un programa"**.
2.) En la nueva ventana, haz clic en **"Instalar un programa no listado"** en la parte inferior izquierda.
3.) Selecciona **"Instalar un programa en una nueva unidad virtual"** y sigue las instrucciones en pantalla, pues allí debe elegir marcar de entre dos opciones: **"Use otra versión de wine"** y elija la que instaló y también marque **"Configurar de Wine"**
4.) Cuando se te pida que elijas un archivo de instalación, navega hasta el archivo WinRAR .exe que descargaste anteriormente y selecciónalo.
5.) Ahora, es posible que en este momento le aparezca un mensaje que dice en resumen que no se puede encontrar **wine-mono**, de clic en el botón **"Instalar":** Si luego aparece otra ventana que dice sobre que no se encuentra **wine-gecko** también instalen (esto puede demorar algún tiempo)
6.) En la siguiente ventana de "Configuración de Wine" en la pestaña "Gráficos"  ponga en "Resolución 110". Aplicar y Aceptar

**Nota:** Si más adelante cuando ya esté instalado y funcionando el programa, no le gusta el tamaño de las letras, si se puede cambiar a otra resolución, ejemplo: 100, o 120 

### Paso 5: Ejecutar WinRAR

Una vez instalado, podrás encontrar WinRAR en la lista de programas instalados en PlayOnLinux. Simplemente selecciónalo y haz clic en "Ejecutar".



### Para instalar WinRAR con Wine

instale Wine buscando en internet para su distribución Linux cómo instalarlo, y si su Distribución Linux lo tiene bien integrado bastará con darle clic derecho al ejecutable de WinRar y abrirlo con Wine y seguir las instrucciones de instalación, pero sino, escriba en una terminal la palabra wine dejando un espacio y luego arrastre allí el ejecutable de WinRar que usted descargó y de Enter e instálelo

Dios les bendiga