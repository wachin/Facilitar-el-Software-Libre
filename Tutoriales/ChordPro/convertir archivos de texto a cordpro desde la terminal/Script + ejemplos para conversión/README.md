# ChordPro Converter

Una herramienta interactiva en Python con interfaz Curses para convertir múltiples archivos de texto con acordes de guitarra al formato ChordPro.

## 🎯 Características

- **Interfaz visual interactiva** con navegación por teclado
- **Selección múltiple** de archivos con barra espaciadora
- **Conversión en cola** de todos los archivos seleccionados
- **Feedback en tiempo real** del progreso de conversión
- **Soporte para nombres de archivos** con espacios y caracteres especiales

## 📋 Requisitos

- Python 3.6 o superior
- Biblioteca `curses` (incluida en Python estándar)
- Node.js y chordpro instalado globalmente

## 🔧 Instalación

1. **Instalar chordpro** (si no lo tienes):
```bash
npm install -g chordpro
```

2. **Clonar o descargar el script**:
```bash
wget https://raw.githubusercontent.com/tu-usuario/chordpro-converter/main/chordpro_converter.py
```

3. **Hacer el script ejecutable**:
```bash
chmod +x chordpro_converter.py
```

## 🚀 Uso

### Ejecución básica:
```bash
python3 chordpro_converter.py
```

### O si lo hiciste ejecutable:
```bash
./chordpro_converter.py
```

### Navegación en la interfaz:
- **Flechas ↑/↓**: Navegar entre archivos
- **Espacio**: Seleccionar/deseleccionar archivo
- **A**: Seleccionar todos los archivos
- **D**: Deseleccionar todos los archivos
- **Enter**: Iniciar conversión de archivos seleccionados
- **Q**: Salir de la aplicación

## 📁 Formato de archivos de entrada

Los archivos .txt deben estar en un formato que chordpro pueda interpretar. Ejemplo:

```plaintext
{title: Nombre de la Canción}
{artist: Artista}

[G]Esta es una línea con acordes
[C]Otra línea con más [G]acordes

{comment: CORO}
{start_of_chorus}
[C]Este es el coro que se [G]repite
{end_of_chorus}
```

## 📤 Formato de salida

Los archivos se convierten al formato ChordPro (.cho) con el comando:
```bash
chordpro archivo.txt --output archivo.cho
```

## 🎹 Directivas ChordPro recomendadas

Para mejores resultados, usa estas directivas en tus archivos .txt:

| Directiva | Función | Abreviatura |
|-----------|---------|-------------|
| `{start_of_verse}` | Inicio de verso | `{sov}` |
| `{end_of_verse}` | Fin de verso | `{eov}` |
| `{start_of_chorus}` | Inicio de coro | `{soc}` |
| `{end_of_chorus}` | Fin de coro | `{eoc}` |
| `{chorus: repeat=4}` | Repetir coro 4 veces | |
| `{comment: texto}` | Comentario | |

## 🔍 Solución de problemas

### Error: "chordpro: command not found"
```bash
npm install -g chordpro
```

### Error: "No module named curses"
```bash
sudo apt install python3-curses  # En Debian/Ubuntu
```

### Los archivos no se convierten correctamente
Asegúrate de que los archivos .txt usen el formato correcto de ChordPro con directivas apropiadas.

## 📝 Ejemplo de archivo de entrada

```plaintext
{title: Cuan grande es Dios}
{subtitle: En Espíritu y Verdad}

{comment: VERSO I}
{start_of_verse}
[C]El esplendor de un Rey[G]
vest[Am]ido en Majestad
{end_of_verse}

{comment: CORO}
{start_of_chorus}
Cuán Gr[C]ande es Dios
Cántal[G]e, Cuán gr[Am]ande es Dios
{end_of_chorus}
{chorus: repeat=2}
```

## 📊 Estructura del proyecto

```
.
├── chordpro_converter.py  # Script principal
├── cancion1.txt          # Archivo de ejemplo
├── cancion2.txt          # Archivo de ejemplo
└── cancion1.cho          # Archivo convertido
```

## 🤝 Contribuir

Las contribuciones son bienvenidas. Puedes:
- Reportar bugs
- Sugerir nuevas características
- Enviar pull requests

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo LICENSE para más detalles.

## 🙋‍♂️ Soporte

Si tienes problemas o preguntas:
1. Revisa la documentación de [chordpro](https://www.chordpro.org/)
2. Abre un issue en el repositorio
3. Contacta al desarrollador

---

¡Feliz conversión de canciones! 🎸
```

## 📋 Para usar el README:

1. **Guarda el contenido** en un archivo llamado `README.md` en el mismo directorio que tu script.

2. **Personaliza** las secciones según tus necesidades (URL del repositorio, información de contacto, etc.).

3. **Si quieres agregar una licencia**, crea un archivo `LICENSE` con el texto de la licencia MIT o la que prefieras.

