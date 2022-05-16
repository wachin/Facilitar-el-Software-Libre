
# Cómo instalar Brackets (Fork Quadre) en MX Linux 21 de 32 bits
Han hecho un Fork de Brackets para seguirle dando mantenimiento y que se pueda usar en Linux. Yo lo he compilado en MX Linux 21 de 32 bits y funciona, y he creado un Fork y allí lo he subido para que lo puedan usar en Linux 32 bits

## DEPENDENCIAS
Brackets necesita node.js 16 para poder ser compilado

## Compilar node.js 16.15.0 para 32 bits

https://nodejs.org/dist/v16.15.0/

descargar:

https://nodejs.org/dist/v16.15.0/node-v16.15.0.tar.xz

extraer:

node-v16.15.0.tar.xz

según las instrucciones de compilación en archivo:

/home/wachin/Dev/nodejs/node-v16.15.0/BUILDING.md

hay que instalar algunos paquetes:

    sudo apt-get install python3 gcc g++ make python3-pip


## Building Node.js

Nota: Si la ruta donde está el código fuente contenga algún espacio la compilación fallará, por eso asegurese que no haya espacios en los nombres de las carpetas

Para compilar build Node.js:

```
./configure
make -j4
sudo make install
```

Para ver la versión instalada:

    node -v



#DESCARGA:


git clone https://github.com/quadre-code/quadre
cd quadre
git submodule update --init
npm install
npm run dist



## Corregir vista previa en en Google-Chrome
Por defecto Quadre usa Google-Chome para la vista previa, pero podemos instalar Chromium para que lo podamos usar y que funcione:

    sudo apt install chromium chromium-l10n chromium-driver chromium-sandbox

Ahora hay que crear un enlace simbólico:

    sudo ln -s /usr/bin/chromium /bin/google-chrome

y para usar siempre deberá usted buscar sus archivos .html desde la opción:


Archivo / Abrir Carpeta ...

Sólo así se cargará la vista previa en Chromium

 

###CONSULTAS

html - Brackets - Live Preview not working - Stack Overflow
https://stackoverflow.com/questions/25108420/brackets-live-preview-not-working
https://stackoverflow.com/a/50334602/10648253
I had this problem as well. What I did was simply goto File->Open Folder... it all worked after all the necessary files were loaded into Brackets. 

Enhacement: Chromium-based forks for live preview · Issue #13010 · adobe/brackets
https://github.com/adobe/brackets/issues/13010

Live preview doesn't work on archlinux · Issue #9562 · adobe/brackets
https://github.com/adobe/brackets/issues/9562




