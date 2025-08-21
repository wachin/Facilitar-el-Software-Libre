## Método 2: Instalación manual desde el código fuente

Método 2: Instalación manual desde el código fuente

Si el paquete no está en los repositorios:

    Descarga el código fuente (puedes buscar versiones antiguas en Launchpad o en repositorios de código)

    Instala las dependencias:

bash

sudo apt install python3 python3-gi python3-gi-cairo gir1.2-gtk-3.0 fuseiso

    Descomprime el código fuente y ejecuta:

bash

cd furiusisomount-sacar/src
python3 main.py
