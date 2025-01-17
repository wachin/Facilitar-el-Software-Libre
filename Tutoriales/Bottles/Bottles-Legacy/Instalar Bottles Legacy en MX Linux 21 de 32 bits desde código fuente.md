

# Instalar Bottles en MX Linux 21 de 32 bits desde código fuente

Según esta guía:

Installation - Bottles   
[https://docs.usebottles.com/getting-started/installation](https://docs.usebottles.com/getting-started/installation)

instalar las dependencias:

```
sudo apt install meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev patool gir1.2-granite-1.0 libgranite-dev zenity
```

Para desinstalar:

sudo apt remove meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev patool gir1.2-granite-1.0 libgranite-dev zenity


Este paquete:

libhandy-1-dev

ya no va, parece que ha quedado obsoleto

Descargar

https://usebottles.com/download/

https://github.com/bottlesdevs/Bottles/releases/tag/continuous-v1


instalé la versión

https://github.com/bottlesdevs/Bottles/releases/tag/continuous-v1

wget https://github.com/bottlesdevs/Bottles/archive/refs/tags/continuous-v1.tar.gz

luego hay que descomprimir el tar.gz con clic derecho y 

Extraer aquí

Instalación
ahora poner en la terminal:

```
cd Bottles-continuous-v1
sudo python3 setup.py install
```

# Para lanzar desde la terminal

```
com.github.mirkobrombin.bottles
```

Para desinsalar (estando dentro de esa misma ruta):



![Alt text](/home/wachin/Imágenes/111511.png)

es posible haya que poner:

sudo 


![Alt text](https://2.bp.blogspot.com/-si5yghcP3YY/Xg648tqrhkI/AAAAAAAAXLs/7AwFbwHxYJwvmgjPfr4CH9XA-i4owdsxwCK4BGAYYCw/s1600/ksnip_20200102-224411.png)


para eso hay que usar lo siguiente







