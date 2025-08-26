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

**Nota:** Esta instalación es para instalar Qt Creator 9 desde los paquetes de la Distribución Linux Debian 12, no desde [Qt](https://www.qt.io/offline-installers).

# **Instalar Qt Creator**
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

## Instalando el control de versiones

En Debian y basados en el como MX, antiX Linux, en Ubuntu y sabores además de **Git**, los sistemas de control de versiones más comunes que puedes encontrar en los repositorios son **Subversion (SVN)**, **Mercurial (Hg)**, y **Bazaar (Bzr)**.

-----

### Descripción de los sistemas de control de versiones

  * **Git**: Es un sistema de control de versiones **distribuido**. Cada desarrollador tiene una copia completa del repositorio y su historial, lo que permite trabajar sin conexión y fusionar cambios más fácilmente. Es el estándar de la industria y el más popular en la actualidad.
  * **Subversion (SVN)**: Es un sistema **centralizado**. Un único servidor aloja el repositorio y los desarrolladores deben conectarse a él para actualizar o enviar cambios. Es menos flexible que Git, pero aún se usa en muchos entornos empresariales.
  * **Mercurial (Hg)**: Al igual que Git, es un sistema **distribuido**. Es conocido por ser fácil de aprender y usar, con comandos intuitivos que lo hacen una buena alternativa a Git, aunque su popularidad es menor.
  * **Bazaar (Bzr)**: También es un sistema **distribuido**. Fue popular en proyectos de código abierto como Ubuntu, pero su uso ha disminuido considerablemente en favor de Git.

Para instalarlos, puedes usar el gestor de paquetes `apt`:

```bash
sudo apt install git gitk
```

```bash
sudo apt install subversion
```

```bash
sudo apt install mercurial
```

```bash
sudo apt install bazaar
```


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

Aquí hay dos opciones, yo uso la 2da:

## OPCIÓN 1: Dejar que Qt Creator cree la base del repositorio Git para luego inicializarlo

Voy a buscar una carpeta que **he creado** para los proyectos hechos en Qt Creator:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivoXn1IBRdaOBJCJOgVKpyPOC18MW-fpIZiFOZ4SNhkRPwIFokA_krdYA8OkQdIYNSk4jNOndB4ICiygX3qaF7WGk-rzfFgF-YY5EFaJ8jjrVZnr0GnBSCdlZhNgtZm_nxkL0womdv-xC5584x08AS2HjIvb_PK6nNgKFAhm_qnT43JPKOTbKt_txaj5c/s16000/20250825-081505%20eligiendo%20una%20carpeta%20para%20el%20proyecto.png)

le pongo un nombre y **Next**:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjDRcRvMfrPR0T88owWh1A8dP2UZ3DRBjh77CaGjnMcENhnEfajk-j9WXGpb5fsK9qzhsqFKHuuUcm2sPu4_kW-cojzbPLRQGn13EiBaEZrb5nTXs-ZbXmZiisRTewZ7pUuKl7d_GmynV1VNA9mx-l2mnmAMN7U9KUBQfF5xJ8Xjrnp8WnP9jCflmApBwo/s16000/20250825-081827%20le%20pongo%20un%20nombre%20al%20proyecto.png)


por defecto está **PySide6**, dejarlo así y Next:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBP_bmNKCPzhHex450LmqjmDxdXrSskWo2KTOAqUoJa1foUXklFxonR4DAE2eYymycd95DhVKvmum71JsuydovyOaFlMWlsdx1DxDEa_PIvmYrexLFv8rRZQziAbjNtYu9y81h2uHrjaetY9mpNNlkHwasD4NEhd7NkI2o0CDYIQNIKRot_5J1EV1XDXk/s16000/20250824-194226%20por%20defecto%20PySide6,%20Next.png)

### Añado el control de versíon Git:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgFG97G1nfxGPJI64l6x2pChUEq7ZH-ty3QVCUHoxJPDasVt9iy3i6xw2bEIFfX2hsTgaTagJtHz7vZxr_OHp-LDZthv7m_UsHBVaTfIeJL6a3m0eLguxRdeuP_uTrWKuW4SWrOjEUh3BVDxNVyJavLbxLFLMfxzaC9bueB6fHKAABcy8z-iR9Mj3o5W7Q/s16000/20250825-083058%20elijo%20el%20control%20de%20versiones.png)

Además se puede configura Git al dar clic en **Configure...**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgNgSTuVeqS2A5_CMfd2NwQzZsNebHYRTs9mHlLyU7L8-p2f15zNZC2u6TJj6xb1QwgIEdG1Qb7wpMeZbyUaU0iQhRB3tQq5MiM_7OHZlbzGsLauzGUjCnIWVU5zV5UX-cnR2VX2Z0WLDmdMRAJkTMv-4sc1IV37Jw-QY2PyFT8Kz3yNrZy9KS4KGwW41U/s16000/20250825-092233%20Version%20Control%20-%20Pertaña%20Git.png)

al darle clic en configurar aparece esto en la pestaña **Git**

```
Configuration
Prepend to PATH:

Miscellaneous
Long count 100   Timeout 30s

[ ] Pull with rebase

Gitk
Arguments:

Repository Browser
Commnad: 
```

#### Pestaña de Configuración de Git en Qt Creator


**Prepend to PATH**

Esto añade una ruta de directorio al **PATH** del sistema. Es útil si el ejecutable de Git no se encuentra en una ubicación estándar y el sistema operativo no puede encontrarlo automáticamente.

**Miscellaneous**

  * **Long count 100**: Establece un límite de 100 para el número de **commits** a mostrar en las vistas de registro. Esto ayuda a optimizar el rendimiento.
  * **Timeout 30s**: Es el tiempo de espera de 30 segundos para las operaciones de Git. Si una operación tarda más, se considera que ha fallado.

**Pull with rebase**

Al activar esta opción, al ejecutar el comando **git pull**, se usa la opción **--rebase**. Esto reorganiza los commits locales sobre los commits remotos en lugar de crear un nuevo commit de fusión.

**Gitk Arguments**

**Gitk** es una herramienta gráfica para explorar el historial de un repositorio de Git. En esta sección se pueden añadir argumentos de línea de comandos para personalizar su comportamiento.

**Repository Browser Command**

Esta opción permite especificar el comando de un navegador de repositorio de Git para abrirlo desde Qt Creator.

y me queda así:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjCwqTA9NM0u4THCh4fL147mjhW3rM1C-MmH8ga180h4dTqjvHqOfKqK5CRxzU_pBCG1Q95jDbW-2E8WhABsqzoqoQOeAJqsnmBY8MvwfpHcs5pFDg0DfcQYbhvJdg5PDcqpfd9f4AZ6lb9qW8Bjm3AE7aacM8Qjnk9VS1jEzqnXxQk-7A-LFO4SLQiUQA/s16000/20250825-092812%20Proyecto%20con%20git%20configurado.png)

ahora veo estos archivos en la ventana:

.gitignore
SolaBibleReader.pyproject
main.py

al dar clic en **Finish** dice que falta instalar **PySide6**:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj9hysOBe3mBU_doDdQ5-CsuL29OoTkBxupcO3DAkM58K9Sh4Zl2VRyNfZhfYyy_AG9Mj8dyMDlzLtn05EPGI4dQLdIy9plkjeOKY0w5OCvgeOFPJCioAZqWpkXEg4ktYDhG-HGbkJk4HUtzBVGSsI9X6EHbvFVj4PELTGr-M7O035a1jKqeerVWgbSVyQ/s16000/20250825-093219%20se%20crearon%20mis%20archivos,%20missing%20PySide6.png)

al ver desde el administrador de Archivos Dophin, veo la carpeta oculta .git y los archivos:

.git
.gitignore
main.py
SolaBibleReader.pyproject

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhmzgAxhOAnqunPJ-6SiP30qUcFbR1IqhRvh8PyXtWG9gaT4MGKqIbWorKwjVZP5QIiF68Q-Jb6wuGaa9xxAYfZmPIBuzTuCCqyIIDO7DTVwdFlz4tJKibrnMnqrrI3Q6RkzFuCVfYVqmSTmk21iIPQy2KKAJ1yjtgB48Yaf6nk6yzIrXVFGtM9654XUd0/s16000/20250825-093636%20se%20han%20creado%20los%20archivos.png)

dentro de .git está el archivo:

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

### 1. Crear un repositorio en GitHub para conectarlo al que creó Qt Creator

Primero, debes crear un nuevo repositorio en tu cuenta de GitHub. Puedes hacerlo desde la página principal de GitHub, haciendo clic en el botón "New repository". Dale un nombre a tu repositorio (por ejemplo, "EpubReader"), elige si será público o privado, y no lo inicialices con gitignote.

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

### 3. Verificar la conexión

Una vez que ejecutes el comando `git push`, se te pedirá que inicies sesión en tu cuenta de GitHub. Después de hacerlo, si actualizas la página del repositorio en tu navegador, verás que todos los archivos de tu proyecto local ya están en GitHub.

### Notas adicionales

  - **`git remote -v`**: Puedes usar este comando para verificar que la URL del repositorio remoto ha sido añadida correctamente. Te mostrará las URLs de `fetch` y `push` para `origin`.
  - **Configuración de Git**: El archivo `.config` que mencionas es parte de la configuración interna de Git y no es algo que necesites modificar manualmente para conectar con GitHub. Los comandos anteriores se encargan de actualizar la configuración necesaria por ti.

## OPCIÓN 2: Para un repositorio ya creado y con contendido en el cual se quiere implementar Qt Creator

En Qt Creator, haz clic en **"File"** (Archivo) > **"New Project"** (Nuevo  proyecto).

Debes seleccionar un lugar donde ya tenías un repositorio de GitHub en el cual estabas desarrollando tu proyecto pero quieres usar Qt Creator para continuar con el mismo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhqWsaOOE75cGGGvO28x5KIYyaxMA0BZx9vdnE6p4Y8EDchghspwyNU8UrpTyGXf9QfUOUXpA3rgiZNglSEk9C6ShrRvW4BNyn70RUjZbasxhuimR2fsIQhCuUU_-Si_w7tkjIQPOpYm0rd-y1lgQfZ_5UaTixGlWU5CY-FkLJK-0PD2dGlD_SYHWfn9c0/s16000/20250826-094400%20selecciona%20la%20carpeta%20anterior.png)

Crear el proyecto encima del repositorio GitHub

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiunjrFhcp_4DfqY7aLs5-gjeaZ8wUlQBCpPfXkchWTLMjvPMolI7CSJB8263h5dGkVpqVV8A-VATHUOVslyxvorv2-pMGyZMBGaaQLjwZGqKKs3OoQ2EuWVhl8QdfoJlLIrejDRsO7hH0F7L6G81LLGsDiQpfCNwrwZPl6ly0ZqgKXdFFtf1AgnUAUnlI/s16000/20250826-094954%20Crear%20el%20proyecto%20encima%20del%20repositorio%20GitHub.png)

en esta ocasión no ponerle el control de versiones:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjitu4gulQ5dVjjYwXJtW-c8OuIzQpLG-RzKFrqCyDWFASLlGJkVOCve4PlZyItQxYr52gvrznNoL_OAEI-SEpN6JZM2kZVsnrWID1uhlapN8_zQYxVLzNHZ3nzPjell2P2RyLt4Xerjwczugm5IM39iebQemsmu01OJZFS8kbouhA-8-0gA4vFkdNV9nw/s16000/20250826-095446%20en%20esta%20ocasión%20no%20ponerle%20el%20control%20de%20versiones.png)

por defecto está PySide6 dejarlo así y Next:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBP_bmNKCPzhHex450LmqjmDxdXrSskWo2KTOAqUoJa1foUXklFxonR4DAE2eYymycd95DhVKvmum71JsuydovyOaFlMWlsdx1DxDEa_PIvmYrexLFv8rRZQziAbjNtYu9y81h2uHrjaetY9mpNNlkHwasD4NEhd7NkI2o0CDYIQNIKRot_5J1EV1XDXk/s16000/20250824-194226%20por%20defecto%20PySide6,%20Next.png)

y listo el proyecto de Qt Creator se puse encima del repositorio git, y Qt Creator dice que falta instalar PySide6

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjxAuotjGs77hLKtaQINrPR4bFS4brNxoYsxK4mUzmZUvB7cT6FkZJA0qZ-LBBbNMX2ImaRVqnckWs0zfvDB-TV3h6J_W0TK_gTAQ-KlcR3Q2uw4-q0OVp01tv66c3X4QcVyTpXJREwlM13hgub1OAOQFt5mAaPew8PDaQXF5DkX6ADFKo505fRwRGro8k/s16000/20250826-100016%20y%20listo%20el%20proyecto%20de%20Qt%20Creator%20se%20puse%20encima%20del%20repositorio%20git.png)

si le da clic en **Install** saldrá un mensaje que dice **This environment is externally managed**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhhSvPKQBV-GUY1slAtzXvYdSHeyMs_7L3KuSFjDZ50TGwp6KyXBZW7qjP1dYBxF198yzh76zDSAEC7HP_5otMqQgXwKdEzOmAyXUhQ-Ng4VUQqmomc53lUKCvBAv1uursCm0bE2-ulKDLinJzcz9WEo6QkQYe4ZIKLMoxaI9leQYvwz-C5ABb7pcAfBZE/s16000/20250825-002306%20si%20se%20le%20da%20clic%20en%20Instalar%20saldrá%20un%20mensaje%20que%20dice%20This%20environment%20is%20externally%20managed.png)


# Cómo configurar un Proyecto Qt Creator con Python

Después de crear un nuevo proyecto de Qt con Python y luego de dejar elegido a Git, en el programa hay un botón que decía para instalar pyside6 con pip y le di clic pero apareció este mensaje en QtCreator:


```plaintext
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

El mensaje de error indica que tu sistema Debian 12 tiene un **“entorno gestionado externamente”** para Python (debido a la **PEP 668**), lo cual impide que `pip` instale paquetes a nivel del sistema sin un permiso explícito. Esta es una característica de seguridad para evitar dañar la instalación de Python del sistema.

Para resolverlo e instalar **PySide6** para usarlo en **Qt Creator** lo siguiente:

---

### Usar un Entorno Virtual (Recomendado para Desarrollo)

Para evitar modificar la instacion Python del sistema y alinearse con la sugerencia del error, crea un entorno virtual:

**1.-** **Instalar `python3-full`:**

```bash
sudo apt install python3-full
```  

**2.-** **Crear un entorno virtual**:
Vaya al directorio de su proyecto en la terminal:

```bash
cd /path/to/your/project
```  

- Crear un entorno virtual:

```bash
python3 -m venv venv
```

- Activarlo:

```bash
source venv/bin/activate
```  

cerrar **Qt Creator**

3. **Instalar PySide6 desde código fuente**

sudo apt install clang qt6-base-dev build-essential cmake python3-dev python3-pip libclang-dev

```bash
git clone https://code.qt.io/pyside/pyside-setup
cd pyside-setup
```



git tag
git checkout 6.5.2



qtpaths



despues de que cerró a Qt Creator, vuelvalo a abrir y de clic en el mensaje que ahora aparece:


   
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





