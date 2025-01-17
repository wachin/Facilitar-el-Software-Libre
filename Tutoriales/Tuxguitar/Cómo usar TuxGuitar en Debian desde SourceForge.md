Voy a crear una guía más completa y estructurada sobre la instalación y uso de TuxGuitar en Debian.

# Guía Completa de TuxGuitar para Debian

## ¿Qué es TuxGuitar?
TuxGuitar es un editor de tablatura y partitura musical multiplataforma gratuito, similar a Guitar Pro. Permite crear, editar y reproducir partituras musicales, especialmente útil para guitarristas.

## Requisitos Previos
- Sistema operativo Debian 11 o 12
- Java Runtime Environment (JRE)

## Instalación de Java
Antes de instalar TuxGuitar, necesitas instalar Java:

```
sudo apt update
sudo apt install default-jre
```

## Instalación de TuxGuitar

### Para Debian 11

**Versión 1.5.6**
**1.) Para sistemas de 32 bits:**

Descarga el archivo .deb de 32 bits
entre en:

https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/

allí busque el archivo:

tuxguitar-1.5.6-linux-x86.deb

Instala el paquete:

```
sudo dpkg -i tuxguitar-1.5.6-linux-x86.deb
```

O también con clic derecho es posible tenga el menú para hacerlo con interfaz gráfica. O vea el siguiente tutorial que hice: https://facilitarelsoftwarelibre.blogspot.com/2016/09/instalar-paquetes-deb-con-gdebi.html

**2.) Para sistemas de 64 bits:**

Descarga el archivo .deb de 64 bits

https://sourceforge.net/projects/tuxguitar/files/TuxGuitar/

allí busque el archivo:

tuxguitar-1.5.6-linux-x86_64.deb

Instala el paquete

```
sudo dpkg -i tuxguitar-1.5.6-linux-x86_64.deb
```

O también con clic derecho es posible tenga el menú para hacerlo con interfaz gráfica

## Para Debian 12

1.) **Versión Portable 1.5.6**

- Descarga la versión Qt4 o Qt5 según tu preferencia
- Descomprime el archivo:

```
tar -xzvf tuxguitar-1.5.6-linux-qt5-x86_64.tar.gz
```

- Entra al directorio:

```
cd tuxguitar-1.5.6
```

y ejecuta:

```
./tuxguitar.sh
```

2.) **Versión 1.6 (solo 64 bits)**
- Descarga el archivo .deb desde:

https://github.com/helge17/tuxguitar/releases

- Instala con:

```
sudo dpkg -i tuxguitar-x-1.x-x_amd64.deb
```

donde x es la versión que ha descargado. O también con clic derecho es posible tenga el menú para hacerlo con interfaz gráfica

## Solución de Problemas Comunes

1. **Si el programa no ejecuta:**
   - Verifica los permisos de ejecución:
     ```
     chmod +x tuxguitar.sh
     ```
   - O desde el administrador de archivos: clic derecho → Propiedades → Permisos → Marcar "Permitir ejecutar el archivo como programa"

2. **Si faltan dependencias:**
   ```
   sudo apt --fix-broken install
   ```

## Funcionalidades Básicas de TuxGuitar

1. **Interfaz Principal**
   - Barra de herramientas con funciones principales
   - Panel de tablatura/partitura
   - Panel de propiedades
   - Mezclador de pistas

2. **Funciones Principales**
   - Crear nueva tablatura/partitura
   - Añadir/eliminar pistas
   - Editar notas y acordes
   - Reproducir la partitura
   - Importar/exportar en varios formatos (GP3, GP4, GP5, MIDI)

3. **Atajos de Teclado Útiles**
   - Ctrl + N: Nueva partitura
   - Ctrl + S: Guardar
   - Espacio: Reproducir/Pausar
   - 1-7: Seleccionar duración de nota
   - A-G: Insertar notas

4. **Herramientas Adicionales**
   - Editor de acordes
   - Afinador digital
   - Generador de ritmos
   - Editor de escalas
   - Transportador de notas

## Notas Importantes
- TuxGuitar 1.6 no está disponible para sistemas de 32 bits
- Para mejor rendimiento, se recomienda tener al menos 4GB de RAM
- Los archivos se guardan por defecto en formato .tg

Dios les bendiga
