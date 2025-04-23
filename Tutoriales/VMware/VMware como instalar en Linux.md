
# Pasos para instalar el archivo .bundle
La siguiente es una guía paso a paso para completar la instalación:


### **1. Abre una terminal en la carpeta donde está el archivo, verifica que el archivo `.bundle` esté allí**
Asegúrate de que el archivo descargado esté en tu directorio de trabajo. Puedes usar el comando `ls` para verificar:

```bash
ls
```

### **2. Dale permisos de ejecución al archivo**
El archivo `.bundle` es un script ejecutable, pero es posible que no tenga los permisos necesarios para ejecutarse. 

Lo más facil es darle clic derecho y en propiedades buscar la opción de ejecutar y marcarlo.

O desde la terminal usa el siguiente comando para otorgarle permisos de ejecución, ejemplo para el nombre del arquivo que descargué:

```bash
chmod +x VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle
```

### **3. Instala las dependencias necesarias**
Antes de instalar VMware Workstation, asegúrate de que tienes todas las dependencias necesarias instaladas. Ejecuta los siguientes comandos como root:

```bash
sudo apt update
sudo apt install build-essential linux-headers-$(uname -r) libssl-dev libffi-dev libglib2.0-dev libgtk-3-dev libx11-dev libxtst-dev libxrender-dev libxrandr-dev libcanberra-gtk-module
```

Estas dependencias son necesarias para compilar los módulos del kernel y asegurar que VMware funcione correctamente.

### **4. Ejecuta el instalador**
Una vez que hayas otorgado permisos de ejecución y verificado las dependencias, ejecuta el instalador con privilegios de root:

```bash
sudo ./VMware-Workstation-Full-17.6.3-24583834.x86_64.bundle
```

Esto iniciará el proceso de instalación. Durante la instalación, se te pedirá que aceptes el acuerdo de licencia y configures algunas opciones básicas.

### **5. Completa la configuración**
Después de la instalación, podrás iniciar VMware Workstation desde el menú de aplicaciones o ejecutándolo directamente desde la terminal:

```bash
vmware
```

La primera vez que lo ejecutes, es posible que te pida compilar los módulos del kernel. Asegúrate de que tienes conexión a internet para descargar cualquier componente adicional que pueda ser necesario.

### **6. Resolución de problemas (si es necesario)**
Si encuentras algún problema durante la instalación o ejecución, aquí hay algunos pasos adicionales que puedes seguir:

- **Verifica el registro del sistema**: Si los módulos del kernel no se compilan correctamente, revisa los logs en `/var/log/vmware-installer` para identificar el problema.
  
- **Actualiza el kernel**: Si estás usando un kernel personalizado o muy reciente, es posible que VMware no sea compatible directamente. En ese caso, intenta actualizar VMware a la última versión o usa un kernel más estable.

- **Reinstala las herramientas de compilación**: Si los módulos del kernel no se compilan, asegúrate de tener las herramientas de desarrollo adecuadas instaladas.

