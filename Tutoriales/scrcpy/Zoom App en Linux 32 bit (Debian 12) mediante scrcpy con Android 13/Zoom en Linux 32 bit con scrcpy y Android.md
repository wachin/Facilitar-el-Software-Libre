### Conectando tu Celular Android a tu Ordenador Linux Debian con scrcpy: Una Solución para Reuniones por Zoom

En esta entrada, te compartiré una solución que he encontrado ideal para aquellas reuniones por Zoom donde el profesor necesita pasar presentaciones y los estudiantes buscan una mejor experiencia visual. Todo comenzó cuando conecté mi celular Android a mi ordenador con Linux Debian 12 de 32 bit utilizando **scrcpy**, una herramienta poderosa que te permite proyectar la pantalla de tu dispositivo Android en tu ordenador de manera fluida y sin complicaciones. Esto en especial a mi me ayuda debido a que mi ordenador es de bajos recursos pues si uso un Linux de 64 bit e instalo Zoom deb el ordenador se pone muy lento y debo usar programas de Ofimática y ya se imaginan que más lenta se pone, tanto que ya no me conviene usar el ordenador, pero eso hasta que encontré que en scrcpy se puede ver la pantalla de Zoom en el ordenador (importante para cuando algún profesor pase proyecciones en Power Point u otro recurso)

#### Compilando scrcpy desde el Código Fuente

Para aquellos interesados en aprovechar al máximo esta herramienta, les dejo una guía sobre cómo compilar scrcpy desde el código fuente:

**[Ver la pantalla de un celular Android en la pantalla de Linux (usar como WebCam) con scrcpy (Linux 32 y 64 bits desde código fuente)](https://facilitarelsoftwarelibre.blogspot.com/2020/08/ver-la-pantalla-de-un-celular-android-en-linux.html)**

allí aprenderás:

- **Instalar las dependencias necesarias:**

- **Clonar el repositorio de scrcpy:**

- **Compilar scrcpy:**

- **Instalar scrcpy:**

#### Conectando tu Celular Android con scrcpy

Una vez compilado e instalado scrcpy, el siguiente paso es conectar tu celular Android al ordenador:

1. **Habilita la depuración USB** en las opciones de desarrollador de tu dispositivo Android.
2. **Conecta el celular al ordenador** usando un cable USB.
3. En tu terminal de Linux, simplemente ejecuta:
   ```
   scrcpy
   ```

Automáticamente, la pantalla de tu celular aparecerá proyectada en tu monitor, permitiéndote controlarla desde tu teclado y ratón.

#### Atajos de Teclado Útiles en scrcpy

Aquí te dejo algunos atajos que te facilitarán la experiencia:

- **Ctrl + f**: Pantalla completa.
- **Ctrl + c**: Copiar texto desde el dispositivo.
- **Ctrl + v**: Pegar texto en el dispositivo.
- **Ctrl + Shift + u**: Desconectar y cerrar.

#### ¿Por qué Usar scrcpy para Reuniones por Zoom?

Durante mis pruebas, noté que **Zoom se ve increíblemente bien proyectado en el monitor del ordenador**. Si eres estudiante o profesor, podrás disfrutar de una experiencia visual mucho más cómoda y clara al ver las presentaciones en la gran pantalla de tu ordenador, en lugar de en la pequeña pantalla del celular. En conclusión, scrcpy no solo es una excelente herramienta para proyectar y controlar tu dispositivo Android desde tu ordenador, sino que también mejora significativamente la experiencia en reuniones virtuales, especialmente en entornos educativos si por alguna razón no puedes instalar Zoom en el ordenador.

---

Esta entrada está basada en mi experiencia personal utilizando scrcpy en un sistema Linux Debian 12 de 32 bit
