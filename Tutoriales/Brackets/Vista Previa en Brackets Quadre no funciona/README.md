## Vista previa en en Google-Chrome no funciona en Linux 32 bits con Chromium
Por defecto Quadre usa Google-Chome para la vista previa, pero podemos instalar Chromium para que lo podamos usar y que funcione en Linux 32 bits:

    sudo apt install chromium chromium-l10n chromium-driver chromium-sandbox

Ahora hay que crear un enlace simbólico:

    sudo ln -s /usr/bin/chromium /bin/google-chrome

y para usar siempre deberá usted buscar sus archivos .html desde la opción:


Archivo / Abrir Carpeta ...

Sólo así se cargará la vista previa en Chromium



