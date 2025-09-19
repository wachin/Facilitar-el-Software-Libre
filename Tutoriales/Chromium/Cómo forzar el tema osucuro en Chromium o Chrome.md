¿Te has preguntado por qué Chromium no sigue automáticamente el tema oscuro de tu sistema en Debian 12, Ubuntu u otras distribuciones Linux aunque tengas configurado el tema oscuro a nivel del sistema? y Firefox si lo haga, Chromium o Chrome a veces necesitan una configuración adicional. En esta guía te mostraré cómo solucionarlo fácilmente.

## ¿Por qué usar el modo oscuro?

Antes de comenzar, es importante destacar que el modo oscuro no es solo una cuestión estética. Muchos usuarios reportan que:
- Reduce la fatiga visual, especialmente cuando se trabaja en entornos con poca luz
- Disminuye el consumo de energía en dispositivos con pantallas OLED
- Puede ayudar a mejorar la concentración al reducir el contraste excesivo

## Solución para el modo oscuro en Chromium

### Paso 1: Habilitar el modo oscuro para el contenido web

1. Abre Chromium y en la barra de direcciones escribe:
   ```
   chrome://flags
   ```

2. Busca la opción **"Auto Dark Mode for Web Contents"**

3. Cambia el valor de **"Default"** a **"Enabled"**

4. Reinicia el navegador cuando te lo solicite

### Paso 2: Habilitar el modo oscuro para la interfaz

Aunque el paso anterior aplica el modo oscuro a las páginas web, la interfaz del navegador (pestañas, barra de direcciones, etc.) podría permanecer en modo claro. Para solucionarlo:

1. Haz clic en los tres puntos verticales en la esquina superior derecha
2. Selecciona **"Configuración"**
3. Busca la opción **"Apariencia"** en el menú lateral
4. En **"Tema"**, selecciona **"Oscuro"**

## Esta solución aplica para:

- Debian 12 (Bookworm)
- Ubuntu 22.04 LTS y superiores
- Linux Mint 21 y superiores
- Otras distribuciones basadas en Debian/Ubuntu
- Otras distribuciones Linux con Chromium

## Configuración adicional opcional

Si quieres forzar aún más el modo oscuro, puedes habilitar estas banderas adicionales en `chrome://flags`:

- **"Force Dark Mode for Web Contents"**
- **"Web Platform Controls Dark Mode"**

## Conclusión

Configurar el modo oscuro en Chromium es sencillo una vez que conoces los pasos adecuados. Con esta configuración, no solo mejorarás tu experiencia visual sino que también podrás trabajar de manera más cómoda durante largas sesiones frente a la pantalla.

**Nota:** *Este tutorial fue probado en Debian 12 con Chromium versión 125. Las opciones pueden variar ligeramente según la versión del navegador.*
