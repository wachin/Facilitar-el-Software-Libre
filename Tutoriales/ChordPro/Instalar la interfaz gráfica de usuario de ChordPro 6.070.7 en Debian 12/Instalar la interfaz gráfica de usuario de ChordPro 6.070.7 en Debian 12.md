

## 🎸 **Tutorial: Instalar ChordPro con Interfaz Gráfica (GUI) en Debian 12**

Antes de seguir, les explico que este tutorial lo hago en Debian 12 de 32 bit por lo que debe servir para Debian 12 de 64 bit y 

Otra recomendación, más abajo cuando toca clonar los repositorios recomiendo hacerlo en una carpeta para el caso, ejemplo:

🗀 ChordPro-src

y allí dentro clonarlos, esto para cuestiones de orden, además cuando usted termine con un repositorio lo mejor es que cierra esa instancia de la terminal y luego abra otra para el otro terminal que va a clonar para evitar equivocaciones


### **Requisitos previos**
Sistema actualizado:

```bash
sudo apt update && sudo apt upgrade -y
```

### **Paso 1: Instalar dependencias esenciales**
Según la página web para compilar para Linux

**Installation on Linux**  
[https://www.chordpro.org/chordpro/chordpro-install-on-linux/](https://www.chordpro.org/chordpro/chordpro-install-on-linux/)

Instalaremos la mayoría de los que allí están en la lista. Ejecute estos comandos para instalar compiladores y librerías necesarias:

```bash
sudo apt install build-essential cpanminus libssl-dev zlib1g-dev \
        libwx-perl libwxgtk3.2-dev libharfbuzz-dev libpango1.0-dev \
        libobject-pad-perl libpdf-api2-perl libimage-info-perl \
        libjson-pp-perl libjson-xs-perl libfile-homedir-perl \
        libdata-printer-perl
```
  
De la lista de la pagina web en Debian 12 no hay los paquetes:

libstorable-perl 
libpod-usage-perl

alternativamente en debian 12 si hay los siguientes que los instalé:

```
sudo apt install libclass-std-storable-perl libpod-simple-perl \
        libpod-parser-perl libpod-pom-perl libpod-coverage-perl
```

### **Paso 2: Instalar módulos Perl requeridos**
Instala los módulos Perl críticos (incluyendo `Wx` para la GUI):

```bash
sudo cpanm Wx Wx::Perl::Packager Data::Printer File::LoadLines HarfBuzz::Shaper \
           JavaScript::QuickJS LWP::Protocol::https Mozilla::CA Pod::Usage \
           Scalar::Util String::Interpolate::Named Text::Layout \
           File::HomeDir Image::Info
```

### **Paso 4: Para Debian 12 de 32 bit tuve que hacer estos pasos:

#### Instalar manualmente JavaScript::QuickJS
En Debian 12 no está disponible el paquete ` libjavascript-quickjs-perl` pero se lo puede instalar manualmente:

```bash
wget http://www.cpan.org/authors/id/F/FE/FELIPE/JavaScript-QuickJS-0.21.tar.gz
tar -xzvf JavaScript-QuickJS-0.21.tar.gz
cd JavaScript-QuickJS-0.21
```

Configurar y compilar manualmente

```bash
perl Makefile.PL
```

si sale el siguiente mensaje no es un error:

```bash
Checking if your kit is complete...
Looks good
Warning: prerequisite Test::Deep 0 not found.
Warning: prerequisite Test::FailWarnings 0 not found.
Warning: prerequisite Test::Fatal 0 not found.
Generating a Unix-style Makefile
Writing Makefile for JavaScript::QuickJS
Writing MYMETA.yml and MYMETA.json
```

sino advertencias sobre dependencias opcionales de pruebas (Test::Deep, Test::FailWarnings, Test::Fatal). El proceso de configuración (Makefile.PL) se completó correctamente y generó los archivos necesarios para la compilación, continuar nomás 

```bash
make
sudo make install
```

Verificar que los módulos estén instalados:

```bash
perl -MJavaScript::QuickJS -e 'print "Módulo instalado\n"'
```

si se instaló, dirá:

```bash
Módulo instalado
```

#### Instalar manualmente libquickjs-dev desde código fuente
**En Debian 12 `libquickjs-dev` no está disponible , instalarlo desde código fuente**:  
   Instala desde fuentes alternativas:
   
```bash
# Instalar QuickJS desde el repositorio oficial
git clone https://github.com/bellard/quickjs.git
cd quickjs
make && sudo make install
```


### **Paso 5: Descargar y compilar ChordPro**

**1.-** Descarga la última versión del código fuente desde GitHub:

```bash
wget https://github.com/ChordPro/chordpro/releases/latest/download/App-Music-ChordPro-6.070.7.tar.gz
tar -xzvf App-Music-ChordPro-*.tar.gz  
```
    
**2.-** Entrar en la carpeta descomprimida:

```bash 
cd App-Music-ChordPro-6.070.7
```  

**3.-** Genera el `Makefile` y compila:

```bash
perl Makefile.PL
make
```

**4.-** Instala en el sistema:

```bash
sudo make install
```  

y quedaron instalados dos programas:  
 
   chordpro
   wxchordpro

---

### **Paso 6: Verificar la instalación**

**Para la versión CLI** (línea de comandos):

```bash
chordpro --version
```

  Debe mostrar: `ChordPro version 6.070.7`.

**Para la GUI**:

```bash
wxchordpro
```

 ¡La interfaz gráfica debería abrirse correctamente!

---

### **Paso 7: Acceso directo (opcional)**
Si quieres un lanzador en el menú de aplicaciones:

**1.-** Crea un archivo `.desktop`:

```bash
sudo nano /usr/share/applications/wxchordpro.desktop
```
    
**2.-** Pega este contenido:

```ini
[Desktop Entry]
Name=wxChordPro
Comment=ChordPro GUI Editor
Exec=wxchordpro
Icon=music
Terminal=false
Type=Application
Categories=Audio;Music;
```
    
**3.-** Actualiza el menú:

```bash
sudo update-desktop-database
```

---

### ✅ **¡Listo!**
Ahora  **ChordPro con GUI** está funcionando en Debian 12 de 32 bit. Puedes:

- Usar `wxchordpro` para la interfaz gráfica.
- Usar `chordpro` para la línea de comandos (más opciones avanzadas).

---

### 📌 **Notas adicionales**
- **Actualizaciones**: Para actualizar, repite los pasos 5 y 6 con la nueva versión.
- **Documentación**: Consulta la ayuda integrada:
    ```bash
    chordpro --manual
    ```
