# Instalar Qt Creator 9 en Debian 12 de 64 o 32 bit + Project - Application (Qt for Python)

 
Esta es la manera en que he instalado en el 2025 a Qt Creator 9 en Debian 12. 

**Nota:** No se si esta instalación también pueda servir para Ubuntu, Linux Mint u otro, si desean probar usen los comandos de instalación de apt más abajo indicados.


# Requisitos previos

1. Actualice sus repositorios:

```bash
sudo apt update && sudo apt upgrade
```

2. Instale QT5 Dev Enviroment

Si usa MX Linux esto está en el instalador de paquetes de MX Linux:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0GQK0QwqspWmlHFZ00W11IeuCtrR7QPit-wXc-9tzqu1K6kNu1ipkaWGjTN2FjFFf7NFoRKQhZvEGkAiU-rlNCXkr9gzfvE9rs88JlMv-Ey9xOk-GERaYyGxED66BjrDp9VHnDTQw3Vt4-YR_Yk32Bleqh_cGws0zmfArsOhFzeflmJkAbZOHR1Gh1_0/s16000/20250823-220544%20QT5%20Dev%20Enviroment.png)

si usa Debian se puede instalar el Repositorio de MX Linux según estas instrucciones:

**Instalar el repositorio de MX Linux en Debian y Sistemas Operativos Linux basados en el, y el instalador MX Instalar paquetes para instalar Ksnip, yt-dlp, otros**  
[https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html)

**Nota:** Esta instalación es para instalar Qt Creator 9 desde los paquetes de la Distribución Linux Debian, no desde [Qt](https://www.qt.io/offline-installers).

# **Instalar Qt Creator y Qt**
Los siguientes son los pasos para instalar Qt Creator en Debian 12 de 32 o 64 bit. Aquí en este tutorial estoy mezclando los dos metodos, pues aún instalando desde el instalador de MX Linux faltan algunas dependencias

## 1. Instala las dependencias
   - Abre una terminal y ejecuta el siguiente comando para instalar Qt Creator y las bibliotecas de Qt:

```bash
sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake \
    dh-make qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools \
    qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools \
    libqt5svg5-dev clang xterm cmake-extras qmlscene-qt6 qmlscene \
    qml qmake6 qt6-base-dev qtcreator qmake6 libdbusmenu-qt5-dev
```
     
   - Añado que en la siguiente entrada: [https://web.stanford.edu/dept/cs_edu/resources/qt/install-linux](https://web.stanford.edu/dept/cs_edu/resources/qt/install-linux) dicen que además hay que instalar lo siguiente:

```bash
sudo apt-get -y install build-essential openssl libssl-dev libssl1.0  \
    libgl1-mesa-dev libqt5x11extras5 '^libxcb.*-dev' libx11-xcb-dev \
    libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev \
    libxkbcommon-x11-dev
```

pero les cuento que sin ellas funciona Qt Creator desde los paquete de la distribución, pero las he instalado por un caso.


## Dependencias para proyecto Python
Para un proyecto de python se necesitan los siguientes paquetes

```bash
sudo apt install python3-all python-pip python3-pylsp
```

donde:

python3-all.- Paquete que depende de todas las versiones compatibles del entorno de ejecución de Python 3.
python3-pip.- Instalador de paquetes de Python.
python3-pylsp.- Implementación de Python del Protocolo de Servidor de Lenguaje.

Esto instalará tanto el IDE Qt Creator con las bibliotecas necesarias para desarrollar aplicaciones en Qt y además el soporte para Python.

## 2. **Abrir Qt Creator**
 Una vez instalado, abre Qt Creator desde el menú de aplicaciones buscalo como `qtcreator`:
 
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEioBDV7r1M17-RTj0q0yJUMSebQ72f5shQBK2PW1XW6UoyxUAs9OBhI31hc3oXTNgVpqvf1eJbNhZqFXKpcqcMcIRCuPpyufNNwZS0mBWF4nG0HcvXEgv3YgLoUAlJMRqteuWJzpiZlcZ62tDjwgPhTr1DLDg2wbhSJO7ZW6mUjw10kjqlf2xA8BnRpktc/s16000/20250824-153132%20menu%20Desarrollo%20-%20Qt%20Creator.png)


## 3. **Crear un nuevo Proyecto "Application (Qt for Python)"**
En Qt Creator, haz clic en el **Welcome** en **"Create Project..."** > **"Application (Qt for Python)"** > **"Empty Application"** > **"Choose..."**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgy7ixTgI6Zoh55gdF8r6mym1qcChU7adnaYRw3faewkfRoMpD6JZ3V8Dd2zi388Sf54iJPpGRgRE4-cNCnsGqzWjWPgJ-Th4q1PO8nUX_67Y-z-EwZKk450SdeL2XQ-WpCWIX1GlkuO2Go7AVbfEtdR9V2SjwjeejzNVzek2h_xTRv_Tum3OwMDhPhGlk/s16000/20250824-153640%20Qt%20Creator%20-%20Create%20Project%20-%20Application%20(Qt%20for%20Python).png)

busque un lugar donde poner su proyecto

# Cree un repositorio nuevo desde cero o Seleccione su repositorio en GitHub o GitLab

Aquí hay dos opciones:

## OPCIÓN 1: Dejar que Qt Creator cree la base del repositorio Git para luego inicializarlo

al continuar me crea un repositorio, veo la carpeta oculta y los archivos:


.git
.gitignore
main.py
SolaBibleReader.pyproject
SolaBibleReader.pyproject.user
.config

y este .config sólo tiene esto:

```plaintext
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
```

Para conectar tu repositorio local de Git con un repositorio en GitHub, debes seguir estos pasos.

### 1. Crear un repositorio en GitHub

Primero, debes crear un nuevo repositorio en tu cuenta de GitHub. Puedes hacerlo desde la página principal de GitHub, haciendo clic en el botón "New repository". Dale un nombre a tu repositorio (por ejemplo, "EpubReader"), elige si será público o privado, y no lo inicialices con un README, `.gitignore` o licencia, ya que tu proyecto local ya tiene los archivos necesarios.

-----

### 2. Conectar el repositorio local con GitHub

Abre una terminal en la carpeta raíz de tu proyecto (donde está el directorio `.git`) y ejecuta los siguientes comandos. Estos comandos le dicen a tu repositorio local dónde está el repositorio remoto en GitHub y luego suben los archivos.

1.  **Añadir la URL del repositorio remoto:**
    Reemplaza `nombre-de-usuario` y `nombre-del-repositorio` con los valores correctos de tu cuenta de GitHub.

    ```bash
    git remote add origin https://github.com/nombre-de-usuario/nombre-del-repositorio.git
    ```

    Este comando crea una conexión llamada **'origin'** que apunta a la URL de tu repositorio en GitHub.

2.  **Subir los archivos iniciales:**
    Sube todos los archivos del repositorio local a la rama principal (o `main`) del repositorio remoto.

    ```bash
    git push -u origin main
    ```

    El comando `git push` sube los cambios. La opción `-u` (o `--set-upstream`) establece la rama `main` de tu repositorio local para que siga la rama `main` del repositorio remoto `origin`. Esto hace que los futuros comandos `git push` y `git pull` sean más sencillos.

-----

### 3\. Verificar la conexión

Una vez que ejecutes el comando `git push`, se te pedirá que inicies sesión en tu cuenta de GitHub. Después de hacerlo, si actualizas la página del repositorio en tu navegador, verás que todos los archivos de tu proyecto local ya están en GitHub.

### Notas adicionales

  - **`git remote -v`**: Puedes usar este comando para verificar que la URL del repositorio remoto ha sido añadida correctamente. Te mostrará las URLs de `fetch` y `push` para `origin`.
  - **Configuración de Git**: El archivo `.config` que mencionas es parte de la configuración interna de Git y no es algo que necesites modificar manualmente para conectar con GitHub. Los comandos anteriores se encargan de actualizar la configuración necesaria por ti.

## OPCIÓN 2: 

Selecciono un lugar donde ya tenías un repositorio de GitHub en el cual estabas desarrollando tu proyecto pero quieres usar Qt Creator para continuar con el mismo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh2sH1EdPhMBphEC2M3irpetJdyI2_Iw3hfGY5j7PwUzUDVB6PkzvA-a12W4gVMNwyLeRDRpkJ3vBcI0f5CaVa5_S72xUHojRlsZcfJCGsPR1F_smABG-tCiLYbsqr-sJAZ57ZOmqhCmfXxrFq_83XoVxWFODm7QLbO1HeASVufAAWRcu6m3HAka2V_JiE/s16000/20250824-154031%20busque%20un%20lugar%20donde%20poner%20su%20proyecto.png)

y allí:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj5kbk62o9iNtwD3PhOdNEnuUU7bVPR52h3Dh9auUQmbp2qB3_Brg0GUJqP2a83wmBPnBI_-G9_jra9gUE0TKHNb7cluT_ZeRzXmuM745lu6WkR0otYH1N8HDlRMUAIIroi1YFfPAiiWpQgmB5oJ8ixscOQtYJQsw4nhvuUyOs4l2oRsWnralp15z582tw/s16000/20250824-193631%20Selecciono%20un%20lugar%20donde%20ya%20tenía%20un%20repositorio%20de%20GitHub.png)

por defecto está PySide6 dejarlo así y Next:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBP_bmNKCPzhHex450LmqjmDxdXrSskWo2KTOAqUoJa1foUXklFxonR4DAE2eYymycd95DhVKvmum71JsuydovyOaFlMWlsdx1DxDEa_PIvmYrexLFv8rRZQziAbjNtYu9y81h2uHrjaetY9mpNNlkHwasD4NEhd7NkI2o0CDYIQNIKRot_5J1EV1XDXk/s16000/20250824-194226%20por%20defecto%20PySide6,%20Next.png)

hj

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjepw8LR2dCF3Ai3EULm0ILwci25sWQL0FjwX-JE1PZ5cngNnucOmk304ItURMcccbpNQQS0DYwxueG95jyDHJUHeo9iB3j1uoIGIAzUUFT1Lx1KKAk8ppssy2YNnSnHe32ng6_LHr1CO_ipDlzbP2z3PeLFwHe6NgXzYC0IyciJyUN7MK8O8Ko6e6Ais8/s16000/20250824-194347%20añado%20los%20archivos%20de%20Git.png)


Qt Creator dice que falta instalar PySide6

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiW8d1dqCbxc63F5akLTjf6r69fMVaG0OmFGeOqcDk4sHOXHEt7Zh3jwofakGybhFsBYneEKE0thtR86_3eg0hIEyO6s05qylAvko_COu87xfy8287qr791jBJXgWH-ql9AzkfsFGeiXH4LNmFBVChaJRfzz3miAQPlS_DvCJGpmzj50h6J9RTPBZXzn4k/s16000/20250825-002000%20Qt%20Creator%20dice%20que%20falta%20instalar%20PySide6.png)


si se le da clic en Instalar saldrá un mensaje que dice This environment is externally managed

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhhSvPKQBV-GUY1slAtzXvYdSHeyMs_7L3KuSFjDZ50TGwp6KyXBZW7qjP1dYBxF198yzh76zDSAEC7HP_5otMqQgXwKdEzOmAyXUhQ-Ng4VUQqmomc53lUKCvBAv1uursCm0bE2-ulKDLinJzcz9WEo6QkQYe4ZIKLMoxaI9leQYvwz-C5ABb7pcAfBZE/s16000/20250825-002306%20si%20se%20le%20da%20clic%20en%20Instalar%20saldrá%20un%20mensaje%20que%20dice%20This%20environment%20is%20externally%20managed.png)



   - En la ventana que aparece, selecciona **"Qt Widgets Application"** si deseas crear una aplicación de escritorio con interfaz gráfica. (También puedes seleccionar otros tipos de proyectos como **"Qt Console Application"** o **"Qt Quick Application"** según tus necesidades.)
   - Haz clic en **"Choose..."** (Elegir) después de seleccionar el tipo de proyecto.

## 4. **Configurar el proyecto**
   - **Nombre del proyecto:** Escribe un nombre para tu proyecto (Sin espacios)
   - **Location:** Elige la ubicación donde deseas guardar el proyecto **"Create in:"**
   - Haz clic en **"Next"** (Siguiente).

## 5. **Configurar el kit de desarrollo**
   - **"Build System"** cambia la opciòn por defecto (CMake) por qmake (si no hace esto en Debian 12 luego no se crea el archivo .pro).

   - Haz clic en **"Next"** (Siguiente).

   - **"Details"** Si desea puede dejar así como está **"Class Information"**

   - Haz clic en **"Next"** (Siguiente).

   - **"Translation"** Si desea puede elegir un idioma

   - Haz clic en **"Next"** (Siguiente).

   - **kits**,  Si todo ha salido bien estará seleccionado por defecto: **"Desktop"** (si no están instaladas las dependencias anteriormente mencionadas no aparece disponible Kits)

   - Haz clic en **"Next"** (Siguiente).

   - **"Summary"** Verá allí en la lista de los archivos que serán añadidos a .pro sin el cual no se puede hacer nada, ejemplo:

     Files to be added in
     /home/wachin/Dev-Qt/Pruebas/ChordT:
     ChordT.pro
     ChordT_es_EC.ts
     main.cpp
     mainwindow.cpp
     mainwindow.h
     mainwindow.ui


## 6. **Finalizar la configuración del proyecto**
   - Revisa el resumen del proyecto y haz clic en **"Finish"** (Finalizar).

## 7. **Construir y ejecutar el proyecto**
   - Una vez que hayas creado el proyecto, Qt Creator abrirá automáticamente el entorno de desarrollo con los archivos de tu proyecto.

## 8. **Modificar la Clase Principal Manualmente**

1. **Abrir Archivos del Proyecto:**

   - Una vez que el proyecto está creado, en el panel de **"Projects"** (Proyectos) en el lado izquierdo, expande las carpetas **"Sources"** y **"Headers"** para ver los archivos `.cpp` y `.h`.

2. **Modificar `main.cpp`:**

   - Abre el archivo `main.cpp`. Este archivo contiene el punto de entrada de tu aplicación.

   - Si estás utilizando `QMainWindow` como la ventana principal, el código se verá algo similar a esto:

     ```cpp
     #include "mainwindow.h"
     #include <QApplication>
     
     int main(int argc, char *argv[]) {
         QApplication a(argc, argv);
         MainWindow w;
         w.show();
         return a.exec();
     }
     ```

3. **Modificar `mainwindow.h` y `mainwindow.cpp`:**

   - Abre `mainwindow.h` y `mainwindow.cpp` para editar la clase de la ventana principal.

   - Si necesitas agregar widgets adicionales o personalizar la ventana principal, puedes hacerlo aquí. La clase `MainWindow` debería heredar de `QMainWindow`, y típicamente se verá así en el archivo `mainwindow.h`:

     ```cpp
     #ifndef MAINWINDOW_H
     #define MAINWINDOW_H
     
     #include <QMainWindow>
     
     namespace Ui {
     class MainWindow;
     }
     
     class MainWindow : public QMainWindow {
         Q_OBJECT
     
     public:
         explicit MainWindow(QWidget *parent = nullptr);
         ~MainWindow();
     
     private:
         Ui::MainWindow *ui;
     };
     
     #endif // MAINWINDOW_H
     ```

   - En `mainwindow.cpp`, se construye y configura la interfaz:

     ```cpp
     #include "mainwindow.h"
     #include "ui_mainwindow.h"
     
     MainWindow::MainWindow(QWidget *parent) :
         QMainWindow(parent),
         ui(new Ui::MainWindow) {
         ui->setupUi(this);
     }
     
     MainWindow::~MainWindow() {
         delete ui;
     }
     ```

4. **Diseño de la Interfaz Gráfica (`mainwindow.ui`):**

   - Abre `mainwindow.ui` en el editor de diseño gráfico de Qt Creator. Aquí puedes arrastrar y soltar widgets para diseñar la interfaz visual de tu aplicación.

   - Para compilar el proyecto, haz clic en el botón **"Build"** (Construir) o presiona `Ctrl + B`.
   - Para ejecutar el proyecto, haz clic en **"Run"** (Ejecutar) o presiona `Ctrl + R`.

## 9. **Modificar y agregar código**
   - Puedes comenzar a modificar el archivo principal (`main.cpp`) y la ventana principal (`mainwindow.ui` y `mainwindow.cpp`) para desarrollar tu aplicación.

## 10. Abrir un ejemplo de aplicación escrita en Qt

- Cierre Qt Creator y vuelvalo a abrir
- Clone el siguiente repositorio en algún directorio (debe tener instalado git):

   ```
   git clone https://github.com/Anchakor/MRichTextEditor
   ```

- En Qt Creator de clic en **"File"** > **"Open File or Project..."** y busque el archivo:  

  **MRichTextEditor.pro**  

- a la derecha de la ventana de clic en **"Configure Project"** y a la izquierda arriba en **"Projects"**  en **"MRichTextEditor (Master)"** busque el archivo: **MRichTextEditor.pro** dandole doble clic para que lo abra, y luego dele clic en:

- **"Build"** > **"Build Project MRichTextEditor"** y a la esquina abajo derecha está la información de la compilación, cuando se ponga verde ya está y de clic en:

- **"Build"** > **"Run"**

y se abrirá el programa.

### Proyectos de programas en Qt en GitHub

Puede buscar en [www.github.com](www.github.com) las palabras:

Text Editor Qt

allí encontré otro proyecto que también se abre:

[https://github.com/pr-ravi/TextEditor-Qt](https://github.com/pr-ravi/TextEditor-Qt)

Dios les bendiga

### Consultas:  

**How to install qt version?(for Linux)**  
[https://forum.qt.io/topic/116658/how-to-install-qt-version-for-linux](https://forum.qt.io/topic/116658/how-to-install-qt-version-for-linux )  

**Instalar ksnip 1.9.0 en Linux desde código fuente 32 y 64 bits (cmake prefix hacia /usr**  
[https://facilitarelsoftwarelibre.blogspot.com/2021/03/compilar-ksnip-desde-codigo-fuente-en-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2021/03/compilar-ksnip-desde-codigo-fuente-en-linux.html)  

**"No QML utility installed" not letting me use Qt6**  
[https://forum.qt.io/topic/145219/no-qml-utility-installed-not-letting-me-use-qt6/9](https://forum.qt.io/topic/145219/no-qml-utility-installed-not-letting-me-use-qt6/9)  
sudo apt install qml-qt6  

**qtcreator: no qml utility**  
[https://groups.google.com/g/linux.debian.user/c/T9yImA-5abY](https://groups.google.com/g/linux.debian.user/c/T9yImA-5abY)  
But if i execute on cmdline  
qml -v  
the output is  
Qml Runtime 5.15.8  
"which qml" says /usr/bin/qml  
This packages are installed:  
sudo apt install qtcreator qml build-essential qtbase5-dev qt5-qmake cmake  

**Getting Started With Qt and Qt Creator on Linux**  
By Jeff Tranter Wednesday, October 12, 2016  
[https://www.ics.com/blog/getting-started-qt-and-qt-creator-linux](https://www.ics.com/blog/getting-started-qt-and-qt-creator-linux)  
sudo apt-get install build-essential libgl1-mesa-dev  

**clazy**  
[https://github.com/KDE/clazy](https://github.com/KDE/clazy)  
Ubuntu: sudo apt install g++ cmake clang llvm-dev git-core libclang-dev  

**Ubuntu 22.04 with Qt6 - qmake: could not find a Qt installation of ''**  
[https://askubuntu.com/questions/1460242/ubuntu-22-04-with-qt6-qmake-could-not-find-a-qt-installation-of](https://askubuntu.com/questions/1460242/ubuntu-22-04-with-qt6-qmake-could-not-find-a-qt-installation-of )  

**How to Compile Qt from Source Code on Linux**  
By Jeff Tranter Wednesday, January 4, 2017  
[https://www.ics.com/blog/how-compile-qt-source-code-linux](https://www.ics.com/blog/how-compile-qt-source-code-linux )  

[https://vitux.com/compiling-your-first-qt-program-in-ubuntu/](https://vitux.com/compiling-your-first-qt-program-in-ubuntu/)  
sudo apt-get install qt5-doc qtbase5-examples qtbase5-doc-html  

**Instalando dmidiplayer 1.7.0 en MX Linux 21 de 32 o 64 bits desde código fuente**  
[https://facilitarelsoftwarelibre.blogspot.com/2022/10/instalando-dmidiplayer-1.7-en-mx-linux-21-desde-src.html](https://facilitarelsoftwarelibre.blogspot.com/2022/10/instalando-dmidiplayer-1.7-en-mx-linux-21-desde-src.html )  



### REQUISITOS
Los siguientes son los requisitos

- Instalar Qt Creator desde el instalador de paquetes de MX Linux. Si no lo tienes y usas ejemplo Debian debes instalar los repositorios para poder tener ese centro de software, vea este tutorial:

**Instalar el repositorio de MX Linux en Debian y Sistemas Operativos Linux basados en el, y el instalador MX Instalar paquetes para instalar Ksnip, yt-dlp, otros**  
[https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html)

- Instalar los paquetes indicados en la siguiente entrada:

**Como instalar Qt Creator 9 en Debian 12 de 64 y 32 bit**   
[https://facilitarelsoftwarelibre.blogspot.com/2025/01/como-instalar-qt-creator-en-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2025/01/como-instalar-qt-creator-en-linux.html)

- Los proyectos de github para usarlos en Qt Creator no pueden tener puntos, deben ser ejemplo así:

SolaBibleReader





# Cómo configurar un Proyecto Qt Creator con Python

Después de crear un nuevo proyecto de Qt con Python y luego de dejar elegido a Git, en el programa hay un botón que decía para instalar pyside6 con pip y le di clic pero apareció este mensaje en QtCreator:

```
Running "/usr/bin/python3 -m pip install PySide6 --user" to install PySide6.
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    
    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
    
    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.
    
    See /usr/share/doc/python3.11/README.venv for more information.

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.
Installing the PySide6 failed with exit code 1
```

The error message indicates that your Debian 12 system has an "externally managed environment" for Python (due to PEP 668), which prevents `pip` from installing packages system-wide without explicit permission. This is a safety feature to avoid breaking the system's Python installation. Based on the suggestions in the error, here’s how to resolve this and install PySide6 for use in Qt Creator:


### Use a Virtual Environment (Recommended for Development)
To avoid modifying the system Python and align with the error's suggestion, create a virtual environment:

1. **Install `python3-full` (if needed)**:
   ```
   sudo apt install python3-full python-pip python3-pylsp
   ```
2. **Create a Virtual Environment**:
   - Navigate to your project directory in the terminal:
     ```
     cd /path/to/your/project
     ```
   - Create a virtual environment:
     ```
     /usr/bin/python3 -m venv venv
     ```
   - Activate it:
     ```
     source venv/bin/activate
     ```
3. **Install PySide6 in the Virtual Environment**:
   ```
   pip install PySide6
   ```
4. **Configure Qt Creator**:
   - In Qt Creator, go to `Tools` > `Options` > `Kits` or `Build & Run` > `Python`.
   - Set the Python interpreter to `venv/bin/python3` (the path to the virtual environment's Python).
   - Save and re-run your project.
5. **Deactivate (when done)**:
   ```
   deactivate
   ```

It keeps your system intact and allows flexibility for development. After setting it up, restart Qt Creator and ensure the virtual environment’s Python is selected. Let me know if you need help with any step!


## Soluciones

**Corrección mensaje de error There is no GCC as compiler**
Con esto se soluciona este mensaje:  

Can't add kits and can't choose Qt version in Qt Creator  

Aquí les pongo las palabras clave de cómo busqué en Google:  

There is no GCC as a compiler and is compatible with your version of Qt for Qt Creator 


## Consultas

