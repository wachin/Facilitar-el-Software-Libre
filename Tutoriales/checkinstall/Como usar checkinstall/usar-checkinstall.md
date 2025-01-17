
Cuando instalas un programa con `sudo make install`, este generalmente copia archivos a varias ubicaciones del sistema (como `/usr/bin/`, `/usr/share/`, `/usr/lib/`, etc.), pero si el archivo `Makefile` no incluye un objetivo `uninstall`, no hay una manera fácil de revertir esa instalación automáticamente

## Para desinstalar un programa con checkinstall sin `make uninstall`:

1. **Uso de `checkinstall`**:
   - En lugar de usar `sudo make install`, puedes usar `checkinstall`, que crea un paquete `.deb` a partir del proceso de instalación. Esto permite que luego puedas desinstalar el programa usando las herramientas estándar de gestión de paquetes (`sudo dpkg -r nombre-del-paquete`).

   Para usar `checkinstall`, sigue estos pasos:
   1. Instala `checkinstall` si no lo tienes:
      ```bash
      sudo apt install checkinstall
      ```
   2. En lugar de `sudo make install`, usa el siguiente comando en el directorio del proyecto:
      ```bash
      sudo checkinstall
      ```
   3. Esto te generará un paquete `.deb` que será instalable con `dpkg` y fácil de desinstalar usando:
      ```bash
      sudo dpkg -r nombre-del-paquete
      ```

### En resumen
Si instalas el programa usando `sudo make install`, y este no incluye una opción para desinstalar, la mejor solución es usar `checkinstall` para generar un paquete que puedas gestionar fácilmente. 


## Al generar un paquete deb con sudo checkinstall este paquete se puede distribuir?

Sí, un paquete `.deb` generado con **`sudo checkinstall`** se puede distribuir y compartir con otros usuarios, pero hay algunas consideraciones importantes que debes tener en cuenta para garantizar que el paquete funcione correctamente en otras máquinas:

### Consideraciones para la distribución de paquetes `.deb` generados con `checkinstall`:

1. **Dependencias del paquete**:
   - `checkinstall` no siempre maneja automáticamente las dependencias necesarias para el correcto funcionamiento del paquete. Cuando creas el paquete, asegúrate de especificar correctamente las dependencias necesarias en el archivo de control del paquete. Si las dependencias no están incluidas o se configuran incorrectamente, los usuarios que instalen tu paquete podrían tener problemas de ejecución.
   - Puedes agregar dependencias de forma manual editando el archivo **control** que `checkinstall` genera en `/var/tmp` antes de crear el paquete.

2. **Especificaciones del paquete**:
   - Cuando usas `checkinstall`, te permite editar ciertos parámetros, como la descripción, la versión, el autor, etc. Es recomendable que personalices estos campos correctamente para que tu paquete esté bien documentado y sea más fácil de mantener y distribuir.
   
3. **Instalación en sistemas diferentes**:
   - Asegúrate de que el paquete `.deb` que generes con `checkinstall` sea compatible con otras máquinas y versiones de Debian (o distribuciones basadas en Debian como Ubuntu). El software compilado en tu máquina podría depender de librerías o configuraciones específicas de tu entorno, lo que podría causar problemas de compatibilidad en otros sistemas. Prueba el paquete en diferentes máquinas o sistemas antes de distribuirlo.
   
4. **Licencias**:
   - Asegúrate de cumplir con las licencias del software que estás empaquetando. Si el software tiene restricciones de distribución, como las licencias GPL o propietarias, debes respetarlas al distribuir el paquete.

### Proceso básico para crear un paquete `.deb` con `checkinstall`:

1. Compila el software como de costumbre:
   ```bash
   ./configure
   make
   ```

2. En lugar de ejecutar `make install`, utiliza `checkinstall` para crear el paquete `.deb`:
   ```bash
   sudo checkinstall
   ```

3. Durante el proceso, se te presentará una pantalla donde puedes editar información importante del paquete (nombre, versión, descripción, dependencias, etc.).

4. Una vez finalizado, tendrás un archivo `.deb` que puedes instalar o distribuir.

### Distribución del paquete `.deb`:
Una vez que el paquete está listo y probado, puedes distribuirlo de varias maneras:

- **Subiéndolo a un servidor** para que otros puedan descargarlo e instalarlo.
- **A través de un repositorio** si tienes acceso a un servidor o deseas crear un repositorio personal para que otros usuarios puedan instalar tu software usando herramientas como `apt`.
  
  Para crear un repositorio personal de Debian, puedes utilizar herramientas como `dpkg-scanpackages` o `reprepro` para organizar y distribuir tus paquetes.

### Conclusión:
El paquete `.deb` generado con `checkinstall` puede distribuirse, pero debes asegurarte de que las dependencias estén bien configuradas y que funcione en otras máquinas. Si todo está en orden, este método es conveniente para crear y distribuir tus propios paquetes `.deb`.


## cuales son las dependencias del programa

Para saber cuáles son las **dependencias** de un programa que has compilado y empaquetado en un `.deb`, puedes utilizar varias estrategias y herramientas que te ayudarán a identificar qué librerías y paquetes son necesarios para que el software funcione correctamente en otro sistema. Aquí te dejo algunos métodos para identificar las dependencias:

### 1. **Revisar la documentación del software**
   Muchas veces, el propio software que estás compilando tiene documentación en el archivo `README`, `INSTALL` o en su página oficial que lista las dependencias necesarias. Esto es especialmente común en proyectos que requieren librerías específicas (como GTK, Qt, etc.).

### 2. **Usar `ldd` para verificar dependencias de las librerías compartidas**
   Si el programa genera binarios (archivos ejecutables), puedes usar el comando `ldd` para ver qué librerías dinámicas (compartidas) necesita. Esto te ayudará a ver qué paquetes debes incluir como dependencias.

   - **Comando**:
     ```bash
     ldd path/to/executable
     ```

   Esto mostrará todas las librerías compartidas necesarias para ejecutar el programa.

   **Ejemplo**:
   ```bash
   ldd /usr/local/bin/mi_programa
   ```

   Verás una lista como esta:
   ```bash
   linux-vdso.so.1 (0x00007ffdc05ef000)
   libX11.so.6 => /usr/lib/x86_64-linux-gnu/libX11.so.6 (0x00007f1db0d72000)
   libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f1db0981000)
   ...
   ```

   Con esta información, puedes determinar qué paquetes proporcionan estas librerías.

### 3. **Utilizar `strace`**
   Puedes usar **`strace`** para ejecutar el programa y rastrear todas las llamadas a archivos y bibliotecas, lo que te ayudará a identificar qué recursos externos necesita para funcionar.

   - **Comando**:
     ```bash
     strace -f ./mi_programa
     ```

   `strace` mostrará todas las llamadas al sistema, incluidas las que buscan archivos de librerías, lo que te permitirá ver qué dependencias externas utiliza.

### 4. **Herramientas automáticas para detectar dependencias**
   Existen varias herramientas que pueden analizar el binario o los archivos del proyecto para generar automáticamente una lista de dependencias.

   #### a. **apt-rdepends**
   `apt-rdepends` muestra las dependencias de un paquete ya instalado o para un paquete que tienes en los repositorios de Debian.

   - **Comando**:
     ```bash
     apt-rdepends package_name
     ```

   Esto puede ser útil si el programa se basa en algún paquete ya conocido que necesitas verificar.

   #### b. **checkinstall**
   Cuando usas `checkinstall`, durante la creación del paquete `.deb`, te ofrece una opción para agregar dependencias manualmente. Si conoces alguna dependencia clave, puedes agregarla en esta etapa.
   
   Cuando se te presente la opción, en el campo "Requiere", puedes agregar los nombres de los paquetes necesarios, separados por comas.

   #### c. **dpkg-shlibdeps**
   Si ya tienes un binario o archivo ejecutable, puedes usar esta herramienta para analizar las dependencias de las bibliotecas compartidas. Esto es útil cuando estás empaquetando un binario.

   - **Comando**:
     ```bash
     dpkg-shlibdeps ./path_to_binary
     ```

   Esto generará una lista de paquetes de Debian que proporcionan las librerías que tu programa necesita.

### 5. **Usar `pkg-config` (para programas que lo soportan)**
   Si el software que estás compilando utiliza `pkg-config` para gestionar las dependencias, puedes usarlo para ver qué librerías se necesitan.

   - **Comando**:
     ```bash
     pkg-config --libs --cflags package_name
     ```

   Esto te dará una lista de todas las librerías necesarias para compilar o ejecutar el programa.

### 6. **Identificar dependencias manualmente usando los archivos de compilación**
   Si tienes acceso al archivo `Makefile` o `CMakeLists.txt` (si el software usa `cmake`), puedes buscar manualmente las librerías y paquetes que se mencionan allí. Las líneas que contienen `-l` (por ejemplo, `-lX11` o `-lGL`) indican librerías necesarias para la compilación y ejecución.

### 7. **Revisar el paquete después de crear el .deb**
   Después de crear el paquete `.deb`, puedes verificar las dependencias que `checkinstall` ha registrado ejecutando el siguiente comando:

   - **Comando**:
     ```bash
     dpkg-deb -I mi_paquete.deb
     ```

   Esto mostrará la información del paquete, incluidas las dependencias (si las has agregado manualmente). También puedes abrir el archivo `control` dentro del `.deb` para ver las dependencias listadas.

---

### Resumen de herramientas:

1. **ldd**: Para revisar las dependencias de bibliotecas compartidas.
2. **strace**: Para rastrear llamadas del sistema y ver los archivos accedidos.
3. **apt-rdepends**: Para ver las dependencias de un paquete instalado.
4. **dpkg-shlibdeps**: Para analizar las dependencias de un binario antes de empaquetar.
5. **pkg-config**: Para proyectos que lo utilizan, ver las librerías necesarias.

Al combinar estos métodos, podrás identificar todas las dependencias necesarias para tu programa y así incluirlas correctamente en el paquete `.deb` que generes para distribuir.


## Cómo se las dependencias para checkinstall si usé las siguientes?
Si las dependencias para compilar el programa fueron estas: 

```
sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake \
     qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools \
     qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools \
     libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev \
     libqt5location5 qtlocation5-dev
```

cuales serían las dependencias que debo agregar en sudo checkinstall?     

Para agregar las dependencias en **`sudo checkinstall`** basándote en los paquetes que usados, debes incluir las que son necesarias para ejecutar el software en el sistema de destino, no necesariamente todas las que usaste para compilarlo (algunas son solo útiles en la fase de compilación).

Aquí te explico cómo identificarlas y agregarlas:

### Paquetes que puedes incluir como dependencias de tiempo de ejecución:

1. **Librerías Qt**: Si tu programa utiliza Qt, debes asegurarte de que las librerías Qt necesarias para ejecutarlo estén presentes en el sistema de destino. Algunas librerías como **`libqt5svg5`**, **`libqt5x11extras5`**, y **`qtwebengine5`** son ejemplos de librerías de tiempo de ejecución que probablemente necesitas.

2. **Herramientas de compilación**: Herramientas como **`build-essential`**, **`cmake`**, **`qtcreator`**, **`extra-cmake-modules`**, y **`qtdeclarative5-dev-tools`** son solo necesarias para la compilación y no para la ejecución del programa, por lo que no deben ser incluidas como dependencias.

### Dependencias más probables para incluir:
Basado en la lista, aquí están las dependencias que generalmente deberían estar presentes para ejecutar el programa:

- **libqt5x11extras5**
- **libqt5svg5**
- **libqt5location5**
- **libqt5webengine5**
- **qtbase5-dev**
- **qtdeclarative5-dev**
- **qttools5-dev**

Estas son las bibliotecas y herramientas relacionadas con **Qt** que el programa podría necesitar en tiempo de ejecución.

### Proceso para agregar dependencias en `checkinstall`:

1. Cuando ejecutes `sudo checkinstall`, se te mostrará una pantalla de configuración en la cual puedes editar los campos de información del paquete. Uno de estos campos es **"Requiere"** (o **"Requires"** en inglés).

2. En este campo, puedes especificar las dependencias separadas por comas. Usando las dependencias más probables mencionadas, esto podría verse así:

   ```
   libqt5x11extras5, libqt5svg5, libqt5location5, libqt5webengine5, qtbase5-dev, qtdeclarative5-dev, qttools5-dev
   ```

pero viendo mi compilación:

https://github.com/wachin/vnote-fork/releases/tag/v3.15.1

https://github.com/wachin/vnote-fork/releases/download/v3.15.1/vnote_3.15.1_i386.deb

el archivo control dice:

libc6 (>= 2.3), libgcc-s1 (>= 3.0), libqt5core5a (>= 5.15.1), libqt5gui5 (>= 5.12.2) | libqt5gui5-gles (>= 5.12.2), libqt5network5 (>= 5.8.0), libqt5printsupport5 (>= 5.0.2), libqt5sql5 (>= 5.0.2), libqt5svg5 (>= 5.6.0~beta), libqt5webchannel5 (>= 5.6.1), libqt5webenginewidgets5 (>= 5.14.1), libqt5widgets5 (>= 5.14.1), libqt5x11extras5 (>= 5.6.0), libstdc++6 (>= 5.2), libx11-6

entonces lo arreglo:

libc6, libgcc-s1, libqt5core5a, libqt5gui5, libqt5gui5-gles, libqt5network5, libqt5printsupport5, libqt5sql5, libqt5svg5, libqt5webchannel5, libqt5webenginewidgets5, libqt5widgets5, libqt5x11extras5, libstdc++6, libx11-6


3. Después de esto, `checkinstall` incluirá esas dependencias en el archivo de control del paquete `.deb`, y cuando alguien intente instalar tu paquete, `apt` o `dpkg` se encargará de instalar automáticamente esas dependencias si no están ya presentes en el sistema.

### Ejemplo del proceso con `checkinstall`:
```bash
sudo checkinstall
```

Durante la ejecución, verás una pantalla que te permite editar la información del paquete. Busca el campo donde se te permite añadir las dependencias (opción **"Requiere"** o **"Requires"**) y agrega las dependencias en ese campo como se indicó.

### Verificación posterior del paquete `.deb`:
Después de generar el paquete, puedes verificar que las dependencias están correctamente listadas con:

```bash
dpkg-deb -I mi_paquete.deb
```

Esto te mostrará la información del paquete, incluyendo las dependencias que has añadido.

# Manual Tracking (Seguimiento manual)
   - Si instalaste el programa con `sudo make install`, puedes revisar los archivos que fueron copiados durante la instalación. Para hacer esto, es recomendable inspeccionar el archivo `Makefile` o usar alguna herramienta de seguimiento.
   
Además de **checkinstall**, existen otras herramientas que permiten realizar el seguimiento de archivos instalados durante la compilación e instalación de un programa en Linux. Algunas opciones son:

### 1. **GNU Stow**
   GNU Stow es una herramienta diseñada para gestionar instalaciones de software de manera ordenada. Permite crear instalaciones en directorios específicos (generalmente en `/usr/local/stow`), lo que facilita desinstalar el software más tarde simplemente eliminando el directorio correspondiente.

   - **Comando**: 
     ```bash
     stow package_name
     ```

### 2. **Installwatch (dentro de CheckInstall)**
   Installwatch es una herramienta que viene integrada con checkinstall, pero también puede usarse de forma independiente. Monitorea los cambios en el sistema de archivos durante el proceso de instalación (principalmente con `make install`), registrando qué archivos han sido creados o modificados.

   - **Comando**:
     ```bash
     installwatch make install
     ```

### 3. **fakeroot**
   **fakeroot** permite simular una instalación sin los permisos de root. Se utiliza a menudo con scripts de instalación o herramientas de empaquetado como `makepkg` o `dpkg` para realizar instalaciones y pruebas en un entorno seguro, sin afectar el sistema real. Es útil si deseas crear un paquete para su distribución.

   - **Comando**:
     ```bash
     fakeroot make install
     ```

### 4. **Auto-apt**
   Esta herramienta intercepta las llamadas al sistema para verificar la existencia de archivos, como los encabezados de desarrollo, y realiza automáticamente la instalación de los paquetes requeridos. Puede hacer un seguimiento de las acciones realizadas durante una compilación.

   - **Comando**:
     ```bash
     auto-apt run ./configure
     auto-apt run make install
     ```

### 5. **Strace**
   **Strace** rastrea llamadas al sistema y señales. Puedes usarlo para monitorear todas las operaciones de escritura en el sistema de archivos durante la instalación de un programa, proporcionando un registro detallado de todos los archivos que se están modificando o creando.

   - **Comando**:
     ```bash
     strace -f -e trace=open,creat,write,unlink make install
     ```

### 6. **Package Tracking System (PTS)**
   Si estás utilizando un sistema de empaquetado como `dpkg` o `rpm`, estas herramientas mantienen un registro de los archivos instalados por cada paquete. `dpkg` (en Debian) o `rpm` (en distribuciones basadas en Red Hat) son métodos robustos para realizar un seguimiento preciso de los archivos de cada paquete instalado.

   - **Comando para Debian**:
     ```bash
     dpkg -L package_name
     ```
   - **Comando para RPM**:
     ```bash
     rpm -ql package_name
     ```

Cada herramienta tiene diferentes usos dependiendo de la distribución de Linux que estés utilizando y la naturaleza de tu instalación (si se trata de una instalación manual o de la creación de un paquete).
