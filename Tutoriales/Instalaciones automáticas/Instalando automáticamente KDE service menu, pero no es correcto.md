
Lo siguiente era para poner en la terminal e instalar, pero no es correcto pues el script de instalación ya copia el archivo .desktop necesario al sistema:


mkdir -p ~/.local/share/kservices5/ServiceMenus
cd /tmp
git clone https://github.com/mefsaal/dolphin-folder-color
cd dolphin-folder-color
cp *.desktop ~/.local/share/kservices5/ServiceMenus
sudo ./install.sh
echo "Dios les bendiga" 


lo correcto es así:


wget https://github.com/mefsaal/dolphin-folder-color/archive/refs/tags/v1.9.tar.gz
tar xf v1.9.tar.gz
cd dolphin-folder-color-1.9
sudo ./install.sh
echo "Dios les bendiga"


eso con un arreglo para descargar una versión específica






# Para instalar WPS Office con MUI y Diccionarios

Deben estar los archivos:

dicts.tar.gz
mui.tar.gz

donde esté este script


#! /bin/bash
mkdir -p ~/.local/share/Kingsoft/office6/
tar -xf dicts.tar.gz -C ~/.local/share/Kingsoft/office6/
tar -xf mui.tar.gz -C ~/.local/share/Kingsoft/office6/

### Explicación
### El indicador "-x" (--extract) le dice a la utilidad Tar que extraiga el archivo
### mencionado en el argumento después de "-f" (--file=[file_name].tar).  
### Mientras que el indicador "-C" (--directory=DIR ) se usa para establecer  
### un directorio específico para extraer el archivo.
### De: How to extract Tar files to a specific directory in Linux 
### https://linuxhint.com/extract-tar-files-linux/
### También ver la ayuda: tar --help




