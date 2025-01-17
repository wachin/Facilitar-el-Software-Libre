

# Instalar Bottles en MX Linux 21 de 32 bits desde código fuente

Según esta guía:

Installation - Bottles   
https://docs.usebottles.com/getting-started/installation

instalar las dependencias:

```
sudo apt install meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev patool gir1.2-granite-1.0 python3 python3-pip python3-gi python3-yaml python3-certifi python3-requests python3-markdown patool p7zip libhandy-1-0 zlib1g gir1.2-gtk-3.0 libglib2.0-bin ibus-gtk3 libfreetype6 gamemode gamemode-daemon libgamemode0 winbind gettext rustc cargo

blueprint-tools

```

libhandy-1-dev
gir1.2-handy-1 gir1.2-notify-0.7


se podría clonar el repositorio:

```
git clone https://github.com/bottlesdevs/Bottles.git
cd Bottles/bottles 
pip3 install --user meson
pip install --user cargo
pip install -r requirements.txt

```

pero a mi esa versión no me funcionó, así que instalé la versión:


instalé la versión

https://github.com/bottlesdevs/Bottles/releases/tag/2021.11.28-treviso

wget -c https://github.com/bottlesdevs/Bottles/archive/refs/tags/2021.11.28-treviso.tar.gz

luego hay que descomprimir el tar.gz con clic derecho y 

Extraer aquí

ahora poner en la terminal:

```
cd Bottles-2021.11.28-treviso
mkdir build
meson build && cd build
ninja -j$(nproc)
ninja install
```

o:

#!/usr/bin/env bash
BUILD_DIR="build/"
if [ -d "$BUILD_DIR" ]; then
	rm -r build
fi
mkdir build
meson build
ninja -j$(nproc) -C build
sudo ninja install -C build


Para desinsalar (estando dentro de esa misma ruta):

```
ninja uninstall
```



# Para crear el deb

Edite el archivo:

/home/wachin/Dev/Bottles-releases/Bottles-3.1.9/debian/compat

ponga:

10

en vez de 9

y ponga:

    dpkg-buildpackage -rfakeroot -b -uc -us

    
    
Para desinstalar:

sudo apt remove meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev patool gir1.2-granite-1.0 python3 python3-pip python3-gi python3-yaml python3-certifi python3-requests python3-markdown patool p7zip libhandy-1-0 zlib1g gir1.2-gtk-3.0 libglib2.0-bin ibus-gtk3 libfreetype6 gamemode gamemode-daemon libgamemode0 winbind gettext rustc cargo


 
 
 
CONSULTAS

python - How can I install packages using pip according to the requirements.txt file from a local directory? - Stack Overflow
https://stackoverflow.com/questions/7225900/how-can-i-install-packages-using-pip-according-to-the-requirements-txt-file-from

How to install Python packages with pip and requirements.txt | note.nkmk.me
https://note.nkmk.me/en/python-pip-install-requirements/

How to Install Rust and Cargo on Ubuntu and Other Linux Distributions
https://itsfoss.com/install-rust-cargo-ubuntu-linux/






