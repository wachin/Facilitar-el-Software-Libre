

# Instalar Bottles en MX Linux 21 de 32 bits desde código fuente

Según esta guía:

Installation - Bottles   
https://docs.usebottles.com/getting-started/installation

instalar las dependencias:

```
sudo apt install meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev libhandy-1-dev patool
```

se podría clonar el repositorio:

```
git clone https://github.com/bottlesdevs/Bottles.git
cd Bottles
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

Para desinsalar (estando dentro de esa misma ruta):

```
ninja uninstall
```


![Alt text](/home/wachin/Imágenes/111511.png)

es posible haya que poner:

sudo 


![Alt text](https://2.bp.blogspot.com/-si5yghcP3YY/Xg648tqrhkI/AAAAAAAAXLs/7AwFbwHxYJwvmgjPfr4CH9XA-i4owdsxwCK4BGAYYCw/s1600/ksnip_20200102-224411.png)


para eso hay que usar lo siguiente







