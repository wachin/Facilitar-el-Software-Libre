

## 🎸 **Tutorial: Instalar ChordPro con Interfaz Gráfica (GUI) en Debian 12**
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




### **Paso 4: Descargar y compilar ChordPro**

1. Descarga la última versión del código fuente desde GitHub:
    ```bash
    wget https://github.com/ChordPro/chordpro/releases/latest/download/App-Music-ChordPro-6.070.7.tar.gz
    tar -xzvf App-Music-ChordPro-*.tar.gz  
    ```
2. Entrar en la carpeta descomprimida:
    ```bash 
    cd App-Music-ChordPro-6.070.7
    ```  
   App-Music-ChordPro-6.070.7
3. Genera el `Makefile` y compila:
    ```bash
    perl Makefile.PL
    make
    ```
4. Instala en el sistema:
    ```bash
    sudo make install
    ```  
   y quedaron instalados dos programas:  
   chordpro
   wxchordpro

---

### **Paso 4: Verificar la instalación**
- **Para la versión CLI** (línea de comandos):
```bash
chordpro --version
```
  Debe mostrar: `ChordPro version 6.070.7`.

- **Para la GUI**:
```bash
wxchordpro
```
  ¡La interfaz gráfica debería abrirse correctamente!

---

### **Paso 5: Acceso directo (opcional)**
Si quieres un lanzador en el menú de aplicaciones:

1. Crea un archivo `.desktop`:
    ```bash
    sudo nano /usr/share/applications/wxchordpro.desktop
    ```
2. Pega este contenido:
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
3. Actualiza el menú:
    ```bash
    sudo update-desktop-database
    ```

---

### 🔍 **Solución de problemas**

1. **Si `wxchordpro` no se abre**:
   - Verifica que `libwxgtk3.2-dev` esté instalado:
        ```bash
        sudo apt install --reinstall libwxgtk3.2-dev
        ```
   - Reinstala los módulos Perl:
        ```bash
        sudo cpanm -f Wx Wx::Perl::Packager
        ```
2. **Errores de dependencias faltantes**:
   - Si falta algún módulo Perl, instálalo manualmente:
        ```bash
        sudo cpanm Nombre::Del::Modulo
        ```

---

### ✅ **¡Listo!**
Ahora tienes **ChordPro con GUI** funcionando en Debian 12. Puedes:
- Usar `wxchordpro` para la interfaz gráfica.
- Usar `chordpro` para la línea de comandos (más opciones avanzadas).

---

### 📌 **Notas adicionales**
- **Actualizaciones**: Para actualizar, repite los pasos 3 y 4 con la nueva versión.
- **Documentación**: Consulta la ayuda integrada:
    ```bash
    chordpro --manual
    ```
