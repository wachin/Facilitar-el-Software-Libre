La siguiente imagen es de un test que he hecho para verificar el correcto funcionamiento de venv:

En el año 2024 la unica manera que me ha funcionado de instalar paquetes desde pip es usando venv el entorno virtual de python

 Para que puedas usar programas en python que dependen de paquetes pip esta es la solución

 Instala

```
sudo apt install python3 python3-pip python3.*-venv
```

 ahora en HOME abre una terminal pues necesitamos usar el comando "python3 -m venv .venv" que se utiliza para crear un entorno virtual en Python, este comando sólo hay que usarlo una vez. Poner en la terminal:

```
python3 -m venv .venv
```

si quieres que se vea la carpeta:

```
python3 -m venv venv
```

 y se creará el entorno virtual

 Un entorno virtual es una herramienta que permite mantener dependencias y paquetes específicos para un proyecto aislado del sistema global de Python. Esto es especialmente útil para evitar conflictos entre versiones de paquetes en diferentes proyectos.
 
Puedes crear múltiples entornos virtuales con diferentes nombres para aislar diferentes proyectos y sus dependencias. Esto es una práctica muy común en el desarrollo de Python para mantener un mejor control sobre los paquetes y evitar conflictos entre proyectos.

## Activar el entorno virtual

 Ahora allí en HOME en la termial ponga:

```
source .venv/bin/activate
```

y si has creado la carpeta para que se vea:

```
source .venv/bin/activate
```

 Mi nombre de usuario es wachin y el nombre de la maquina es netinst y a continuación les pongo como puse el comando y lo que aparece en la terminal:

```
wachin@netinst:~$ source .venv/bin/activate
(.venv) wachin@netinst:~$
```

 si pongo ls se muestran normalmente los directorios:

```
/home/wachin/Descargas
/home/wachin/Documentos
/home/wachin/Escritorio
/home/wachin/Música
etc
```

 y si pongo: ls -a se muestran además los archvos ocultos:

```
/home/wachin/.cache /home/wachin/.config
/home/wachin/.local
/home/wachin/.venv
/home/wachin/Descargas
/home/wachin/Documentos
/home/wachin/Escritorio
/home/wachin/Música
etc
```

 Como ve allí está la carpeta .venv

 el comando mencionado hace que se active el entorno virtual, y desde ahora podremos instalar paquetes pip dentro del entorno virtual:

```
pip install nombre_del_paquete
```

 Ejemplo voy a instalar para hacer un test:

```
pip install requests
```

### Navegando con cd desde el entorno virtual hasta el lugar donde está el script en python
Una vez que usted ha activado .venv y cuando ya está así:

```
wachin@netinst:~$ source .venv/bin/activate
(.venv) wachin@netinst:~$
```

allí usted puede clonar o descargar algún código y ejecutarlo allí, pero si lo tiene en otra ruta, use cd para moverse a la ruta donde usted tenga el código, ejemplo:

```
wachin@netinst:~$ source .venv/bin/activate
(.venv) wachin@netinst:~$ cd ruta-a-el-codigo-a-usar
```

y quedará:

```
wachin@netinst:~$ source .venv/bin/activate
(.venv) wachin@netinst:ruta-a-el-codigo-a-usar $ 
```

y allí usted podrá ejecutar un scipt, ejemplo:

```
wachin@netinst:~$ source .venv/bin/activate
(.venv) wachin@netinst:ruta-a-el-codigo-a-usar $ python3 mi-script.py
```



## Desactivar el entorno virtual

 cuando ya no lo necesites pon:

```
deactivate
```

 **Nota:** Los programas que dependen de paquetes pip no funcionan si no está activado su entorno virtual.

# Script para hacer un test a VENV

 Ahora creemos un script en python para que por medio del paquete requests probar si funciona el entorno virtual VENV correctamente, el código es el siguiente:

```
import requests

def check_requests():
    try:
        response = requests.get('https://jsonplaceholder.typicode.com/todos/1')
        if response.status_code == 200:
            print("El paquete 'requests' está instalado y funciona correctamente.")
            print("Respuesta del servidor:")
            print(response.json())
        else:
            print("El paquete 'requests' está instalado, pero hubo un problema con la solicitud.")
    except Exception as e:
        print("Ocurrió un error:", e)

if __name__ == "__main__":
    check_requests()

```

 ejemplo el scritp deberá tener un nombre como el siguiente:

 **test\_venv.py**

 en este caso guardelo dentro del directorio .venv pues este tutorial lo hago para un amigo el cual tenía que poner dentro de la carpeta virtual de python un script en python (si desea puede ver los archivos ocultos desde su administrador de archivos con Ctrl + H), entonces:

```
cd .venv
```

 además luego poner ls para ver los archivos allí presentes:

```
(.venv) wachin@netinst:~$ cd .venv
(.venv) wachin@netinst:~/.venv$ ls
bin  include  lib  pyvenv.cfg
```

 para que lo cree y guarde use nano, ponga así:

```
nano test_venv.py
```

 y allí pegue el codigo, y guardelo con Ctrl + O, luego de Enter y Ctrl + X para sarlir. Si necesita algún tutorial sobre como usar nano vea: https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html o puede usar vi

 luego ponga ls y ya lo verá allí, ejemplo:

```
(.venv) wachin@netinst:~/.venv$ ls
bin  include  lib  pyvenv.cfg  test_venv.py
```

## Qué hace el script:

*   Importa el módulo **requests**.
*   Define una función **check\_requests** que hace una solicitud GET a un endpoint de prueba (**https://jsonplaceholder.typicode.com/todos/1**).
*   Verifica si la solicitud fue exitosa (código de estado 200).
*   Imprime un mensaje confirmando que el paquete **requests** está instalado y funcionando correctamente.
*   Imprime la respuesta JSON obtenida del servidor para que puedas ver que la solicitud se realizó correctamente.
*   Maneja cualquier excepción que pueda ocurrir durante la solicitud.

 Si el paquete **requests** está correctamente instalado y no hay problemas de conexión a internet, deberías ver un mensaje indicando que está funcionando, junto con los datos obtenidos de la solicitud.

 Entonces para ejecutarlo pongo en la terminal:

```
python3 test_venv.py
```

 claro que debe entener el lugar donde estámos ubicados, bueno aquí pongo todo:

```
(.venv) wachin@netinst:~/.venv$ python3 test_venv.py
El paquete 'requests' está instalado y funciona correctamente.
Respuesta del servidor:
{'userId': 1, 'id': 1, 'title': 'delectus aut autem', 'completed': False}
(.venv) wachin@netinst:~/.venv$
```

 Funciona bien.

# Script en BASH para abrir el entorno virtual si el código del script en PYTHON está en .venv

 Si usted como en este ejemplo con estas indicación por algún motivo debe tener su script python en su home/usuario dentro de la carpeta oculta:

 .venv

**Nota:** la ruta completa desde la raíz de linux es: /home/wachin/.venv donde wachin es el nombre de mi usuario.

 que en este caso se llama:

 test\_venv.py

 o sea por todo estaría así:

 /home/wachin/.venv/test\_venv.py

 podemos acceder fácilmente a el desde un script en **BASH** desde HOME, ejemplo:

 /home/wachin/venv\_home\_launcher.sh

 Desactíve el entorno virtual si lo tenía activado, ponga en su HOME:

```
deactivate
```

 o sea así:

```
(.venv) wachin@netinst:~$ deactivate
wachin@netinst:~$
```

 Créelo con el siguiente contendo, copielo:

```
#! /bin/bash

# Activate the virtual environment
source .venv/bin/activate

# Change to the directory containing the Python script
cd .venv

# Run the Python script
python3 test_venv.py
```

 Guarde este script con ejemplo el nombre ( si desea puede ponerle otro nombre):

```
wachin@netinst:~$ nano venv_home_launcher.sh
```

 y allí pegue el codigo, y guardelo con Ctrl + O, luego de Enter y Ctrl + X para sarlir.

 y desde una terminal abierta en HOME láncelo así:

```
bash ./venv_home_launcher.sh
```

 así logrará hacerlo funcionar:

```
wachin@netinst:~$ bash ./venv_home_launcher.sh
El paquete 'requests' está instalado y funciona correctamente.
Respuesta del servidor:
{'userId': 1, 'id': 1, 'title': 'delectus aut autem', 'completed': False}
```

# Scritp en bash para abrir el entorno virtual VENV desde cualquier lugar donde esté el script en python (pero no tiene opción para desactivar VENV)

 Si usted tiene su script en python que depende para funcionar de un paquete pip y lo tiene ejemplo en **Documentos**, para este ejemplo usemos el ya hecho, aquí les pongo el lugar donde lo tengo:

```
wachin@netinst:~/Documentos$ tree
.
├── e-Sword
│   ├── Bookmarks.lstx
│   ├── journal.jnlx
│   ├── markup.ovlx
│   ├── study.notx
│   └── topic.topx
├── FeatherNotes
│   └── 2024-07-15-wachi.fnx
└── test_venv.py

3 directories, 7 files
```

 navego hasta donde está donde quiero crear el script en bash, en este caso:

```
wachin@netinst:~$ cd Documentos
wachin@netinst:~/Documentos$
```

 y ponga lo siguiente y de Enter:

```
wachin@netinst:~/Documentos$ nano venv_dir_launcher.sh
```

 **Nota:** Además usted puede abrir una terminal allí donde esté su script en python desde su administrador de archivos en vez de hacer eso desde la terminal.

 copie el siguiente contenido:

```
#! /bin/bash

# Si su programa en python usa algun paquete desde
# pip, esta es la manera de lanzarlo rapidamente
# Pon este script en cualquier lugar donde está
# programa en python
# Activate the virtual environment
source $HOME/.venv/bin/activate

# Automáticamente se redigirá a este lugar desde
# la activación de .venv
# Run the Python script
python3 test_venv.py
```

 y allí pegue el codigo, y guardelo con Ctrl + O, luego de Enter y Ctrl + X para sarlir.

## Poner permisos de ejecución desde el administrador de archivos

 A este script pongale permisos de ejecución puede ser desde el administrador de archivoss con clic derecho y clic la pestaña permisos marcandolo como ejecutable

## Poner permisos de ejecución desde la terminal

 Para otorgar permisos de ejecución a un script en Linux desde la terminal, puedes utilizar el comando **chmod**. Aquí tienes dos opciones comunes:

1.  **Usando el parámetro **+x**:**
2.   Para asignar permisos de ejecución al archivo **venv\_dir\_launcher.sh**, ejecuta:

```
$ chmod +x venv_dir_launcher.sh
```

    Esto permitirá que el archivo se ejecute.

3.   **Asignando valores numéricos:**

4.  Si prefieres asignar permisos específicos, puedes usar valores numéricos. Por ejemplo, para dar permisos de ejecución al usuario propietario y solo permisos de lectura al grupo y al invitado:

```
$ chmod 0755 venv_dir_launcher.sh
```

    En este caso, el **0** indica que no se asignan permisos al grupo y al invitado.

 Puedes verificar los permisos con **ls -la venv\_dir\_launcher.sh**.

 Bueno, con esto hemos puesto creado el script en bash junto al script en python, puedo verificarlo con ls:

 Para ejecutarlo no debe estar usando venv, desactívelo si tenía activado:

```
deactivate
```

 aquí les pongo el ejemplo:

```
(.venv) wachin@netinst:~$ deactivate
wachin@netinst:~$
```

 y navego hasta el lugar donde está el script o abro una terminal allí, ejemplo para este caso:

```
wachin@netinst:~$ cd Documentos
wachin@netinst:~/Documentos$ ls
e-Sword  FeatherNotes  test_venv.py
```

 y allí ejecutelo abriendo una terminal allí y poniendo:

```
bash ./venv_dir_launcher.sh
```

con eso se ejecutará.

### Cómo hago para usarlo con mi script

Para su script .py abralo con nano o con un editor de texto y cambie la linea:

```
#! /bin/bash

# Si su programa en python usa algun paquete desde
# pip, esta es la manera de lanzarlo rapidamente
# Pon este script en cualquier lugar donde está
# programa en python
# Activate the virtual environment
source $HOME/.venv/bin/activate

# Automáticamente se redigirá a este lugar desde
# la activación de .venv
# Run the Python script
python3 test_venv.py
```

 por el nombre de su script en python, ejemplo:

```
#! /bin/bash

# Si su programa en python usa algun paquete desde
# pip, esta es la manera de lanzarlo rapidamente
# Pon este script en cualquier lugar donde está
# programa en python
# Activate the virtual environment
source $HOME/.venv/bin/activate

# Automáticamente se redigirá a este lugar desde
# la activación de .venv
# Run the Python script
python3 su_script.py
```

 y guarde el script en bash



# Scritp en bash para abrir el entorno virtual VENV desde cualquier lugar donde esté el script en python con opción de desactivar VENV

El siguiente script si tiene una opción para desactivar VENV usando Konsole, está hecho para usar el script 

test_venv.py:

usado anteriormente:

```
#!/bin/bash

# Este script abre una nueva ventana de Konsole, activa un entorno virtual de Python,
# ejecuta un script de Python y luego permite al usuario desactivar el entorno antes de cerrar.

# Abre una nueva ventana de Konsole y ejecuta los siguientes comandos en ella
konsole --noclose -e bash -c '
    # El comando `konsole --noclose -e bash -c` es una instrucción para abrir una
    # nueva ventana de Konsole (el emulador de terminal usado en entornos KDE)
    # con ciertas opciones específicas. Vamos a desglosarlo parte por parte:
    # `konsole`: Este es el comando básico para abrir una nueva ventana de Konsole.
    # `--noclose`: Esta opción le dice a Konsole que no cierre la ventana automáticamente
    # cuando el comando que se está ejecutando termine. Normalmente, si abres Konsole
    # para ejecutar un comando específico, la ventana se cerraría cuando ese comando
    # terminara. Con `--noclose`, la ventana permanece abierta.
    # `-e`: Esta opción significa "ejecutar". Le dice a Konsole que debe ejecutar el
    # comando que viene a continuación.
    # `bash`: Este es el nombre del shell que queremos usar. Bash es uno de los shells
    # más comunes en sistemas Unix y Linux.
    # `-c`: Esta es una opción para bash que significa "comando". Le dice a bash que
    # debe ejecutar el comando que viene a continuación como una cadena de texto.
    # Entonces, cuando pones todo junto: `konsole --noclose -e bash -c '...'`
    # Significa: "Abre una nueva ventana de Konsole, no la cierres automáticamente
    # cuando termine, y ejecuta el siguiente comando usando bash".
    # Todo lo que va dentro de las comillas simples `'...'` después de `-c` es el
    # comando (o serie de comandos) que se ejecutará en esa nueva ventana de Konsole.
    # Este enfoque nos permite abrir una nueva ventana de Konsole y ejecutar una serie
    # de comandos en ella, manteniendo la ventana abierta hasta que decidamos cerrarla
    # explícitamente (en nuestro caso, usando qdbus al final del script).
    
    # Muestra un mensaje indicando que se está activando el entorno virtual
    echo "Activando el entorno virtual..."

    # Activa el entorno virtual de Python
    source $HOME/.venv/bin/activate

    # Confirma que el entorno virtual ha sido activado
    echo "Entorno virtual activado."

    # Anuncia que se va a ejecutar el script de Python
    echo "Ejecutando test_venv.py..."

    # Ejecuta el script de Python
    python3 test_venv.py

    # Confirma que el script ha terminado de ejecutarse
    echo "Ejecución de test_venv.py completada."

    # Deja una línea en blanco para mejor legibilidad
    echo ""

    # Explica al usuario sus opciones
    echo "El entorno virtual sigue activo. Para desactivarlo, escribe \"deactivate\" y presiona Enter."
    echo "Para salir sin desactivar, simplemente presiona Enter."
    echo ""

    # Espera la entrada del usuario
    read -p "> " user_input

    # Si el usuario escribe "deactivate", desactiva el entorno virtual
    if [ "$user_input" = "deactivate" ]; then
        deactivate
        echo "Entorno virtual desactivado."
    fi

    # Indica al usuario cómo cerrar la ventana
    echo "Presiona Enter para cerrar esta ventana."
    read

    # Obtiene el ID del proceso de Konsole
    konsole_pid=$PPID

    # Usa qdbus para enviar un comando de cierre a la ventana de Konsole
    qdbus org.kde.konsole-$konsole_pid /konsole/MainWindow_1 org.qtproject.Qt.QWidget.close
' -p tabtitle=PFSLE  # Establece el título de la pestaña como "PFSLE"
```

este es el contenido del poderoso script.

## Manual de Uso: Script de Entorno Virtual Python

Este manual explica cómo usar el script `open-venv-environment.sh` para trabajar con un entorno virtual de Python.

## ¿Qué hace este script?

Este script automatiza los siguientes pasos:
1. Abre una nueva ventana de terminal (Konsole).
2. Activa un entorno virtual de Python.
3. Ejecuta un script de Python llamado `test_venv.py`.
4. Te da la opción de desactivar el entorno virtual.
5. Cierra automáticamente la ventana de terminal.

## Requisitos previos

Antes de usar este script, asegúrate de que:
1. Tienes Konsole instalado (viene por defecto en sistemas KDE).
2. Tienes un entorno virtual de Python creado en `$HOME/.venv`.
3. Existe un archivo `test_venv.py` en el directorio desde donde ejecutas el script.

## Cómo usar el script

1. Abre una terminal.
2. Navega hasta el directorio donde se encuentra el script.
3. Asegúrate de que el script tiene permisos de ejecución:
   ```
   chmod +x open-venv-environment.sh
   ```
4. Ejecuta el script:
   ```
   ./open-venv-environment.sh
   ```

## Qué esperar

1. Se abrirá una nueva ventana de Konsole con el título "PFSLE".
2. Verás mensajes indicando que se está activando el entorno virtual y ejecutando `test_venv.py`.
3. Después de que `test_venv.py` termine, se te dará la opción de desactivar el entorno virtual.
   - Si quieres desactivarlo, escribe `deactivate` y presiona Enter.
   - Si no quieres desactivarlo, simplemente presiona Enter.
4. Presiona Enter una vez más para cerrar la ventana de Konsole.

## Solución de problemas

- Si la ventana no se cierra automáticamente, puedes cerrarla manualmente.
- Si `test_venv.py` no se ejecuta, asegúrate de que existe en el directorio correcto.
- Si el entorno virtual no se activa, verifica que existe en `$HOME/.venv`.

## Personalización

Puedes modificar el script para:
- Cambiar la ubicación del entorno virtual (si usan otro nombre de entorno virtual al que yo uso: .venv pueden cambiar eso en el script)
- Ejecutar un script de Python diferente para que lo usen para sus scripts en python, solo cabien en el script las tres líneas que contienen: test_venv.py por el nombre de su script, pueden hacerlo con Ctrl + F para encontrar la palabra, o incluso también usar la opción para reemplazar de su editor de texto.
- Cambiar el título de la pestaña de Konsole.

Para hacer estos cambios, edita el archivo `open-venv-environment.sh` con un editor de texto.

Dios les bendiga

## Consultas

 Python Software Foundation. (2023). The Python Standard Library: venv. Recuperado de [https://docs.python.org/3/library/venv.html.](https://docs.python.org/3/library/venv.html.) 

 Kenneth Reitz & Python Software Foundation. (2023). Requests: HTTP for Humans. Recuperado de [https://docs.python-requests.org/en/latest/](https://docs.python-requests.org/en/latest/)

 How to determine if Python is running inside a virtualenv? [https://stackoverflow.com/questions/1871549/how-to-determine-if-python-is-running-inside-a-virtualenv](https://stackoverflow.com/questions/1871549/how-to-determine-if-python-is-running-inside-a-virtualenv)

 Issues using the Python Plugin with a Virtual Environment (venv) [https://discourse.orthanc-server.org/t/issues-using-the-python-plugin-with-a-virtual-environment-venv/4258](https://discourse.orthanc-server.org/t/issues-using-the-python-plugin-with-a-virtual-environment-venv/4258)

 Python Virtual Environments: A Primer [https://realpython.com/python-virtual-environments-a-primer](https://realpython.com/python-virtual-environments-a-primer)/

 Understanding Python virtual environments using venv and virtualenv [https://medium.com/@sukul.teradata/understanding-python-virtual-environments-using-venv-and-virtualenv-283f37d24b13](https://medium.com/@sukul.teradata/understanding-python-virtual-environments-using-venv-and-virtualenv-283f37d24b13)
