 



Se instala con los siguente en la terminal:

sudo apt install xvkbd

xvkbd

[http://t-sato.in.coocan.jp/xvkbd/](http://t-sato.in.coocan.jp/xvkbd/)

xvkbd es un programa de teclado virtual (gráfico) para el sistema X Window
que permite introducir caracteres en otros software haciendo clic en un teclado que se muestra en la pantalla. Puede utilizarse en sistemas sin teclado físico, como terminales de kiosco o dispositivos portátiles. Este programa también permite
enviar caracteres especificados como opción de línea de comandos a otro
cliente.



# Tutorial de xvkbd - Teclado Virtual para X Window

¡Hola! Si estás estudiando informática, este tutorial te ayudará a entender **xvkbd**, un teclado virtual muy útil para sistemas Linux/Unix. Vamos a desglosarlo en partes fáciles de entender.

## ¿Qué es xvkbd?

**xvkbd** es un teclado gráfico que te permite escribir en cualquier aplicación haciendo clic en sus teclas virtuales. Es especialmente útil cuando:

- No tienes teclado físico (kioskos, tablets)
- Necesitas escribir caracteres especiales
- Quieres automatizar la entrada de texto

![Ejemplo de xvkbd](http://t-sato.in.coocan.jp/xvkbd/xvkbd.gif)

## Instalación

### Método 1: Con configure (más fácil)
```bash
# Descargar y descomprimir
wget http://t-sato.in.coocan.jp/xvkbd/xvkbd-4.1.tar.gz
tar -xzf xvkbd-4.1.tar.gz
cd xvkbd-4.1

# Compilar e instalar
./configure
make
sudo make install
```

### Método 2: Con xmkmf (alternativo)
```bash
xmkmf
make install install.man
```

## Uso Básico

### Ejecutar xvkbd
```bash
xvkbd
```

Al ejecutarlo, verás una ventana con un teclado completo. Para usar:

1. **Haz clic en cualquier ventana** donde quieras escribir
2. **Haz clic en las teclas de xvkbd** para escribir

### Teclas especiales (muy importante)

| Botón del ratón | Función |
|----------------|---------|
| Clic izquierdo | Tecla normal |
| Clic derecho | Mayúsculas (Shift) |
| Clic central | Control (Ctrl) |

## Funciones Avanzadas

### 1. Enfoque (Focus)
Si al hacer clic en xvkbd pierdes el enfoque de la ventana destino:
- Haz clic en el botón **"Focus"** en xvkbd
- Luego haz clic en la ventana donde quieres escribir
- Para quitar el focus: clic derecho en "Focus" o doble clic

### 2. Modificadores Rápidos
¡Funciona como en los smartphones! Mantén presionada una tecla y mueve el ratón:

| Dirección | Modificador |
|-----------|-------------|
| ↑ | Shift |
| → | AltGr |
| ← | Control |
| ↓ | Meta |

### 3. Autocompletado de Palabras
Desde el menú principal (logo "xvkbd"):
- Selecciona **"Word Completion..."**
- Al escribir, verás sugerencias
- Haz clic en una sugerencia para completar

## Uso desde Línea de Comandos

### Enviar texto automáticamente
```bash
# Escribe "Hola Mundo" en la ventana activa
xvkbd -text "Hola Mundo"

# Con Enter al final
xvkbd -text "ls -la\\r"

# Con combinación de teclas
xvkbd -text "\\Ca"  # Envía Ctrl+A
```

### Caracteres especiales disponibles:
- `\\r` - Enter
- `\\t` - Tabulador
- `\\b` - Backspace
- `\\e` - Escape
- `\\[Left]` - Flecha izquierda
- `\\{Ctrl_L}` - Tecla Control izquierda

### Enviar desde un archivo
```bash
# Enviar contenido de un archivo
xvkbd -file mi_archivo.txt

# Con delay entre caracteres (útil para aplicaciones lentas)
xvkbd -file comandos.txt -delay 100
```

## Personalización

### Hacer la ventana más pequeña
```bash
xvkbd -geometry 220x90 -compact
```

### Solo teclado numérico
```bash
xvkbd -keypad
```

### Cambiar distribución del teclado
Desde el menú: **"Change Keyboard Layout..."**
- Español, Francés, Alemán, etc.

## Ejemplos Prácticos para Estudiantes

### 1. Automatizar comandos
```bash
# Script para abrir terminal y listar archivos
xvkbd -text "gnome-terminal\\r"
sleep 2
xvkbd -text "ls -la\\r"
```

### 2. Práctica de programación
```bash
# Escribir un programa simple en Python
xvkbd -text "nano hola.py\\r"
sleep 1
xvkbd -text "print(\\\"Hola Mundo\\\")\\r"
xvkbd -text "\\O"  # Ctrl+O para guardar
xvkbd -text "\\r"  # Enter
xvkbd -text "\\X"  # Ctrl+X para salir
```

### 3. Navegación web automatizada
```bash
# Abrir Firefox y navegar
xvkbd -text "firefox\\r"
sleep 3
xvkbd -text "\\Ca"  # Ctrl+A (seleccionar barra de direcciones)
xvkbd -text "http://www.ejemplo.com\\r"
```

## Consejos de Seguridad

**¡IMPORTANTE!** Si usas xvkbd en sistemas multiusuario:
```bash
xvkbd -secure
```
Esto desactiva funciones peligrosas como ejecución de comandos externos.

## Solución de Problemas Comunes

### Los caracteres no llegan a la ventana
- Usa el botón **"Focus"**
- Prueba con: `xvkbd -no-jump-pointer`

### La ventana es muy grande
```bash
xvkbd -geometry 300x100 -compact
```

### No funciona Ctrl+Alt+Backspace
- xvkbd no puede simular esta combinación por seguridad

## Recursos Adicionales

- **Página oficial**: http://t-sato.in.coocan.jp/xvkbd/
- **FAQ**: http://t-sato.in.coocan.jp/xvkbd/faq.html
- **Manual completo**: `man xvkbd`

## Proyecto Sugerido

Crea un script que use xvkbd para:
1. Abrir un editor de texto
2. Escribir un programa simple
3. Compilarlo y ejecutarlo
4. Capturar el resultado

¡Es perfecto para practicar automatización y entender mejor cómo interactúan las aplicaciones en Linux!

¿Tienes alguna pregunta sobre alguna función específica? ¡Estoy aquí para ayudarte!
