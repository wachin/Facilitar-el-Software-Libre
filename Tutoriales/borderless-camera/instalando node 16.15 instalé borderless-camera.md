

# Requerimientos
sudo apt install git npm yarn


Clonar

    git clone https://github.com/grigio/borderless-camera 
    cd borderless-camera 

y poner:

    npm install

y para lanzar:

    npm start

Se puede lanzar siempre entrando desde una terminal y poniendo ese ultimo comando.



# Para crear el portable

Poner en la terminal

    yarn run build

aparecerá error en la terminal:

    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:77:12)
    at node:internal/main/run_main_module:17:47
    error Command failed with exit code 1.

eso es porque no se pudo crear el appimage y algún otro paquete, pero se creará una carpeta:

/borderless-camera/dist/linux-ia32-unpacked

con clic derecho asegúrese que está marcado como Ejecutable el archivo:

borderless-camera 

allí entrar desde una terminal y poner:

./borderless-camera

y se abrirá el programa





.




    
