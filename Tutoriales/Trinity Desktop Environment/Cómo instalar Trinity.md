



sudo gedit /etc/apt/sources.list.d/trinity.list


> ¡Advertencia!
Asegúrate de reemplazar <your-distribution-release-name> con el nombre real de tu distribución (por ejemplo, "bullseye" o "buster").


TDE R14.1.x series

deb http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-r14.1.x <your-distribution-release-name> main deps

# Optional sources
deb-src http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-r14.1.x <your-distribution-release-name> main deps



Import GPG signing key

The best way to install GPG key is to manually download and install package trinity-keyring. The advantage is that this method of installation is not dependent on the availability of the key server. Another advantage is that the key is not integrated into the global apt keyring, but is installed as a separate file:

wget http://mirror.ppa.trinitydesktop.org/trinity/deb/trinity-keyring.deb
sudo dpkg -i trinity-keyring.deb

Aquí tienes la traducción al español:

---

Instalar Trinity

    Si estás realizando una instalación nueva de TDE, sigue los pasos que se indican a continuación.
    Si estás actualizando desde una versión existente, sigue las instrucciones de la sección de actualización.

Instalación nueva

Se recomiendan los siguientes pasos para instalar la última versión.
Messagebox warning.png

¡Advertencia!
El paquete tde-trinity es un metapaquete completo. Para instalar un entorno mínimo, reemplaza tde-trinity por tdebase-trinity en las instrucciones siguientes.
Serie TDE R14.x.y

```bash
sudo apt-get update  
sudo aptitude install tde-trinity  
```

--- 

Notas:  
- Conservé los términos técnicos como "metapaquete" y los comandos en inglés, ya que son estándar.  
- "Messagebox warning.png" se dejó igual, asumiendo que es una referencia a un icono.  
- Se mantuvo el formato de lista y los comandos exactos para precisión técnica.

CONSULTAS

https://wiki.trinitydesktop.org/Debian_Trinity_Repository_Installation_Instructions
