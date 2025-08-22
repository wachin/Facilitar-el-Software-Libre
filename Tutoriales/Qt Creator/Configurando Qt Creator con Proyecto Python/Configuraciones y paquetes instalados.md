



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


- Para un proyecto de python se necesitan los siguientes paquetes

sudo apt install python3-all python-pip python3-pylsp

donde;

python3-pylsp.- Python implementation of the Language Server Protocol


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
   sudo apt install python3-full
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