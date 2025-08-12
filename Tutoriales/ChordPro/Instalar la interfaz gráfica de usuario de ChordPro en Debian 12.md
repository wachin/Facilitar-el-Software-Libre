

## 🎸 **Tutorial: Instalar ChordPro con Interfaz Gráfica (GUI) en Debian 12**
### **Requisitos previos**
1. Sistema actualizado:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
2. Acceso a `sudo` o como root.

---

### **Paso 1: Instalar dependencias esenciales**
Ejecuta estos comandos para instalar compiladores y librerías necesarias:
```bash
sudo apt install build-essential cpanminus libssl-dev zlib1g-dev \
                libwx-perl libwxgtk3.2-dev libharfbuzz-dev libpango1.0-dev
```

---

### **Paso 2: Instalar módulos Perl requeridos**
Instala los módulos Perl críticos (incluyendo `Wx` para la GUI):
```bash
sudo cpanm Wx Wx::Perl::Packager Data::Printer File::LoadLines HarfBuzz::Shaper \
           JavaScript::QuickJS LWP::Protocol::https Mozilla::CA Pod::Usage \
           Scalar::Util String::Interpolate::Named Text::Layout
```

---

### **Paso 3: Descargar y compilar ChordPro**

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
