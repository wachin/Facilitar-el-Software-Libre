
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
