# Respaldar Diccionarios & Diccionario de Corrección Ortográfica de LibreOffice, Firefox, Chrome o Chromium, Kate, Ghostwriter, Inkspace, Vnote
Se imaginan ustedes después de dos años de usar los correctores ortográficos y haber añadido varias palabras tener que formatear el sistema y perder todo eso, bueno pues se puede respaldar todo el contenido, para esto:


## Chrome o Chromium
Viendo los archivos y carpetas ocultos con Ctrl +H en el administrador de archivos, la ubicación del diccionario de Google Chrome, o Chromium en Linux es:

Chrome: ~/.config/google-chrome/Default/Custom Dictionary.txt

Chromium: ~/.config/chromium/Default/Custom Dictionary.txt

respaldar esos archivos.


## Firefox
Para Firefox clic en:

1. Abre tu carpeta de perfil de usuario:  

Haz clic en el botón de menú de las tres rayitas, en Ayuda y selecciona Más Información para solucionar problemas. 

Se abrirá la pestaña Información para solucionar problemas. 

En la sección Configuración básica de la aplicación, junto a Directorio de perfil, haz clic en Abrir directorio. Se abrirá la carpeta de tu perfil. 

Respalda el archivo persdict.dat 


## LibreOffice
Ver los archivos ocultos e ir a la ruta:

~/.config/libreoffice/4/user/workbook

Respaldar: standard.dic



## Ghostwriter
En directorio y archivo:

~/.config/ghostwriter/dictionaries/personal



## Kate
En mi caso en la raíz de mi usuario:

~/.hunspell_es

~/.hunspell_es_EC


## Inkscape
Los archivos del diccionario personal de Aspell utilizado por Inkscape en sistemas Debian 12 (como también MX Linux 23) están en:

~/.config/enchant

Ejemplos:

~/.config/enchant/en_US.dic

~/.config/enchant/es.dic

Inkscape y otros programas que utilizan Aspell suelen almacenar sus diccionarios personales dentro del directorio .config/enchant, que se encuentra en el directorio home del usuario.
Esto es algo importante de tener en cuenta, ya que la ubicación del diccionario personal puede variar dependiendo de la distribución de Linux que se esté utilizando. En Ubuntu, por ejemplo, suele estar en el usuario con archivos como:

~/.aspell.en.pws


## VNote
VNote utiliza Hunspell para los diccionarios de corrección ortográfica, y cuando uno elige un idioma y cuando uno añade una palabra nueva esa palabra será añadida en el diccionario en su HOME ejemplo para el español de Ecuador:

~/.hunspell_es_EC

# Añadir o quitar palabras a los diccionarios
Por cierto, se pueden añadir palabras nuevas o quitar editando esos archivos

Dios les bendiga 
