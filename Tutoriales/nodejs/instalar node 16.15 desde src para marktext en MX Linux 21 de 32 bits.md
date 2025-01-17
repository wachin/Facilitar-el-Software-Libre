Las siguientes instrucciones para compilar node fueron para marktext

marktext/BUILD.md at develop · marktext/marktext
https://github.com/marktext/marktext/blob/develop/docs/dev/BUILD.md

On Debian-based Linux: 

    sudo apt-get install libx11-dev libxkbfile-dev libsecret-1-dev libfontconfig-dev


# Compilar node.js 16.15.0 para 32 bits

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


 
# Install eslint
https://stackoverflow.com/a/49282220/10648253

sudo npm install -g eslint
  
 
sudo npm install -g npm@8.8.0
 
 
eslint -v
 
     
## To install the Yarn package manager, run:

     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
     echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn


# Let's build

/home/wachin/Dev/marktext/

Go to marktext folder,  Install dependencies: 
    
yarn install 
    
 
No se pudo compilar porque dice que falta una opcion de electron que solo es para 64 bits así que no se podrá compilar


   Build MarkText binaries and packages: 
    
    yarn run build
    
   MarkText binary is located under build folder



How to install Node.js 16 on Ubuntu 20.04 LTS by Josh Sherman
https://joshtronic.com/2021/05/09/how-to-install-nodejs-16-on-ubuntu-2004-lts/

electron/electron: Build cross-platform desktop apps with JavaScript, HTML, and CSS
https://github.com/electron/electron
