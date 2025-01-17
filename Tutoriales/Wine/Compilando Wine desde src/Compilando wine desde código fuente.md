

Descargar el código fuente y compilar con

Lo siguiente es para Wine 1.6, 2.0:

sudo apt install flex bison make libjpeg-dev libxslt1-dev wine32-preloader libgnutls28-dev libx11-dev libfreetype6-dev build-essential

pero no funciona en los Linux desde 2020 aprox


sudo apt remove flex bison libjpeg-dev libxslt1-dev wine32-preloader libgnutls28-dev libx11-dev libfreetype6-dev

sudo apt remove libjpeg-dev libxslt1-dev wine32-preloader libgnutls28-dev libx11-dev libfreetype6-dev

sudo apt remove libjpeg-dev libxslt1-dev

sudo apt remove wine32-preloader libgnutls28-dev

sudo apt remove libfreetype6-dev

el siguiente no se puede desinstalar:

sudo apt remove libx11-dev
