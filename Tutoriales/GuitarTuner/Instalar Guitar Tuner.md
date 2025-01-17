# Tratando de hacer funcionar GuitarTuner en Debian 12

## Descripción General
GuitarTuner es un afinador cromático simple diseñado principalmente para guitarra, aunque funciona con cualquier instrumento. El programa:
- Detecta automáticamente las notas a través del micrófono
- Emite una señal acústica cuando la afinación es correcta
- Permite cambiar la frecuencia de referencia
- Funciona en un rango de 60 a 2000 Hz (C2 a C7)
- Tiene una precisión alta (< 0.5 cents cerca de A4)
- Soporta modo claro y oscuro en macOS

## Opciones de Instalación

### 1. Para usuarios de macOS (Intel)
1. Simplemente descarga la aplicación compilada desde el enlace proporcionado
2. Doble clic para instalar
3. ¡Listo para usar!

### 2. Instalación desde Python para Debian 12

#### Prerequisitos:
1. Instala Python y pip si no los tienes:
```
sudo apt install python3-pip portaudio19-dev libjpeg-dev zlib1g-dev \
    libxcb1-dev python3-pil python3-pil.imagetk python3-dev \
    python3-setuptools libtiff5-dev libopenjp2-7-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev \
    tk8.6-dev libharfbuzz-dev libfribidi-dev 
```

#### Pasos de instalación:
1.) Descarga el código fuente del proyecto

```
git clone https://github.com/TomSchimansky/GuitarTuner
```

usa cd para entrar allí:

```
cd GuitarTuner
```

3.) Instala allí las dependencias:

```bash
pip3 install -r requirements.txt

```
4.) Ejecuta la aplicación:
```bash
python3 main.py
```

*Nota*: Si tienes configurado un entorno virtual activalo, ejemplo:

```
source .venv/bin/activate
```

y luego navega hasta donde esté el programa y alli si pon `python3 main.py`

### 3. Crear tu propia aplicación independiente

#### Para macOS:
1. Asegúrate de tener un entorno virtual de Python limpio
2. Instala py2app
3. Ejecuta:
```bash
python3.8 setup.py py2app
```

#### Para Windows:
1. Necesitarás py2exe en lugar de py2app
2. Modifica el archivo setup.py para Windows
3. Crea el ejecutable usando py2exe

## Notas Importantes
- Para el modo oscuro en macOS: Solo funciona con la versión de Python de Anaconda
- Si usas la versión de python.org en macOS y el modo oscuro da problemas:
  - Abre setup.py
  - Elimina la línea: 'NSRequiresAquaSystemAppearance': False

## Resolución de Problemas Comunes
1. Si el micrófono no es detectado:
   - Verifica los permisos del sistema
   - Asegúrate de que el micrófono esté conectado antes de iniciar la aplicación
2. Si las dependencias no se instalan:
   - Intenta instalarlas una por una
   - Verifica que tu versión de Python sea compatible