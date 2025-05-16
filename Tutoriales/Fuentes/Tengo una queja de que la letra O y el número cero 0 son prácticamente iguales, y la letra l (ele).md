# ¿Letra 'O' o número '0'? una distinción necesaria para mejorar la legibilidad al ingresar números  

En el mundo digital, la legibilidad no es solo una cuestión estética, sino también de funcionalidad y accesibilidad. Uno de los problemas más comunes que enfrentamos —especialmente quienes trabajamos con código, configuraciones técnicas o tipografías monoespaciadas— es la casi _indistinguible_ diferencia entre la letra mayúscula **O** y el número **0** (cero).

Esto puede parecer un detalle menor, pero en la práctica puede causar confusión, errores en contraseñas, direcciones IP, claves de producto o líneas de código. Más aún, para personas con discapacidad visual o baja visión, esta similitud representa una barrera innecesaria que puede resolverse fácilmente con una pequeña mejora tipográfica.

## ¿Cuál es el problema?

Tanto en fuentes proporcionales como monoespaciadas, muchos diseños tipográficos hacen que la letra 'O' y el número '0' luzcan prácticamente iguales. Esto puede generar ambigüedad, especialmente en contextos donde ambos caracteres pueden aparecer juntos, como en nombres de usuario, identificadores únicos, códigos de programación, etc.

Un usuario expresó su frustración así:

> _“La letra mayúscula 'O' y el número '0' son casi idénticos tanto en la fuente proporcional como en la monoespaciada. Creo que sería una mejora maravillosa tener una barra diagonal en el glifo cero para distinguir más fácilmente los dos. ¡Este cambio también se alinearía con el objetivo principal de la fuente de ser ‘altamente legible’!”_

**Make 'O' and '0' glyphs more easily distinguishable. #20**  
[https://github.com/polarsys/b612/issues/20#issue-510390247  
](https://github.com/polarsys/b612/issues/20#issue-510390247)   

## ¿Cuál es la solución?

Una solución ampliamente aceptada es **añadir una barra diagonal o un punto al glifo del número cero (0)**. Esto permite distinguirlo de la letra 'O' a simple vista. Algunas fuentes ya implementan esta mejora, como:

-   Fira Code 
-   Cascadia Code
-   Source Code Pro
-   Hack
-   Consolas
-   JetBrains Mono
-   Liberation Mono  
    
-   DejaVu Sans Mono (en algunas versiones) 

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhddl5FnLXoBq-DiR5k_00yDW7D3cmOTtOAccOCF7bYUifg7maLFiR154aH23b3wM4t0BUJMfJCNVbofoyRGiJuUQpUer6FwNlXd3xUyWqdIwlBp0XOwbcjP-KRgr_62dnu1_1jh2wrfbPWkhu2rQBdHRyiHSxjXLZ2kJuR3PxDvHnpmhWlQ-rJdY9VPO8/s16000-rw/20250505-0001%20barra%20diagonal%20o%20un%20punto%20al%20glifo%20del%20n%C3%BAmero%20cero%20(0).png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhddl5FnLXoBq-DiR5k_00yDW7D3cmOTtOAccOCF7bYUifg7maLFiR154aH23b3wM4t0BUJMfJCNVbofoyRGiJuUQpUer6FwNlXd3xUyWqdIwlBp0XOwbcjP-KRgr_62dnu1_1jh2wrfbPWkhu2rQBdHRyiHSxjXLZ2kJuR3PxDvHnpmhWlQ-rJdY9VPO8/s657/20250505-0001%20barra%20diagonal%20o%20un%20punto%20al%20glifo%20del%20n%C3%BAmero%20cero%20(0).png)

Estas fuentes son particularmente populares en entornos de desarrollo por su claridad y legibilidad, y muchas de ellas son de código abierto.

## ¿Qué podemos hacer?

Si eres desarrollador, diseñador o administrador de sistemas, considera cambiar tu fuente predeterminada por una que diferencie claramente entre 'O' y '0'. También puedes contribuir en proyectos de tipografía libre sugiriendo mejoras como esta.

Y si eres diseñador tipográfico o contribuyes a un proyecto de fuente libre, ¡piensa en la inclusión de esta pequeña pero poderosa diferencia! Una línea en el cero puede representar una gran mejora para miles de usuarios.

## ✍️ Cómo descargar fuentes que distinguen claramente entre ‘O’ y ‘0’

Estas fuentes son ideales si deseas evitar confusiones entre la letra **O** y el número **0**, ya que incluyen una barra o punto en el glifo del cero. Aquí te dejo una lista con enlaces y cómo instalarlas en Debian.

* * *

### 🔤 **Fira Code**

🧭 [Descargar desde Google Fonts](https://fonts.google.com/specimen/Fira+Code)

* * *

### 🔤 **Cascadia Code**

🧭 [Descargar desde Google Fonts](https://fonts.google.com/specimen/Cascadia+Code)

* * *

### 🔤 **Source Code Pro**

🧭 [Descargar desde Google Fonts](https://fonts.google.com/specimen/Source+Code+Pro)

* * *

### 🔤 **Hack**

🔗 [Repositorio en GitHub](https://github.com/source-foundry/Hack)

📦 En Debian, Ubuntu:

    sudo apt install fonts-hack

* * *

### 🔤 **Consolas** (Microsoft Windows)

🪟 Fuente predeterminada en varios entornos de Windows. No está disponible oficialmente para Linux, pero puedes obtenerla desde tu instalación de Windows.

* * *

### 🔤 **JetBrains Mono**

🧭 [Descargar desde JetBrains](https://www.jetbrains.com/es-es/lp/mono/)

📦 En Debian, Ubuntu:

    sudo apt install fonts-jetbrains-mono

* * *

### 🔤 **Liberation Mono**

🔗 [Repositorio en GitHub](https://github.com/liberationfonts/liberation-1.7-fonts)

📦 En Debian, Ubuntu:

    sudo apt install fonts-liberation

* * *

### 🔤 **DejaVu Sans Mono**

🔗 [Sitio oficial](https://dejavu-fonts.github.io/)

📦 En Debian, Ubuntu:

    sudo apt install fonts-dejavu-core

* * *

💡 **Consejo**: Puedes previsualizar estas fuentes en tu editor de texto o terminal escribiendo una línea de prueba como:

    O0O0O0O0O0

Fuentes como estas hay más, como [Iosevka](https://github.com/be5invis/Iosevka) y muchas otras.

* * *

## 🌐 Cómo aplicar estas fuentes también en el navegador web (por ejemplo, Firefox)

No solo los editores de texto permiten cambiar la fuente. También puedes hacerlo en tu navegador web, como Firefox, para mejorar la legibilidad al leer documentos técnicos, foros, código fuente o documentación en línea.

### 🔧 Pasos para configurar una fuente legible en Firefox

1.  Abre **Firefox**.
2.  Haz clic en el menú ☰ (arriba a la derecha) y selecciona **“Ajustes”** o escribe `about:preferences` en la barra de direcciones.
3.  Desplázate hasta la sección **“Idioma y apariencia”**.
4.  En **“Fuentes y colores”**, haz clic en **“Fuentes…”**.
5.  En la ventana que aparece:
    
    -   Cambia la **fuente monoespaciada** por una como **Fira Code**, **JetBrains Mono**, **Hack**, etc.
    -   Opcional: También puedes cambiar la fuente proporcional o serif si deseas aplicar esta mejora en todo el navegador.
6.  Marca la opción **“Permitir a las páginas elegir sus propias fuentes…”** si quieres que algunas webs respeten su diseño, o **desmárcala** si prefieres que siempre se use tu fuente personalizada.
7.  Haz clic en **Aceptar** para guardar los cambios.

### 📌 Recomendación

Estas fuentes monoespaciadas no están pensadas solo para programadores; también son útiles para documentos técnicos, biblias interlineales, configuraciones, contraseñas, etc. Si trabajas frecuentemente con texto en la web, puede ser muy útil activarlas.

* * *

## 🧐 ¿Y si no quiero usar una fuente monoespaciada?

La mayoría de fuentes proporcionales (como Arial, Roboto, Times New Roman) **no hacen una distinción clara** entre la letra mayúscula **O** y el número **0**. Sin embargo, existe una notable excepción:

### 🔤 **Atkinson Hyperlegible**

Una fuente proporcional **diseñada para accesibilidad**, que incluye un **punto visible dentro del cero (0)**, facilitando su identificación inmediata incluso para personas con baja visión.

📥 [Descargar desde Braille Institute](https://brailleinstitute.org/freefont)

> 💡 Esta fuente es ideal si deseas una apariencia más moderna o informal (no técnica)

### 🔤 **Atkinson Hyperlegible**

-   ✔️ Tiene un **punto visible dentro del cero (0)**.
-   ✔️ Es proporcional, no monoespaciada.
-   ✔️ Diseñada por el **Braille Institute** para personas con baja visión.
-   ✔️ **Gratis y libre de usar** 
    
    [![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAZ_eh5d2nxwc5KadUTzzgqcKTXzba_lH9qqWpGfPYBbFnVTqZAnsOuasmmRf7XId4tuMFojZLVMalA8i8nXINQKFMELRhYe8_ItwP4shTHnuh7nk4dCLAVl9v6cg16_R1bI9mqqqDYdqZAr-h1kiNk9ARrH1mfFJUKm389tC7mh3rC8TgxrqTB21Lj-w/s16000-rw/20250505-0006%20Atkinson%20Hyperlegible.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAZ_eh5d2nxwc5KadUTzzgqcKTXzba_lH9qqWpGfPYBbFnVTqZAnsOuasmmRf7XId4tuMFojZLVMalA8i8nXINQKFMELRhYe8_ItwP4shTHnuh7nk4dCLAVl9v6cg16_R1bI9mqqqDYdqZAr-h1kiNk9ARrH1mfFJUKm389tC7mh3rC8TgxrqTB21Lj-w/s591/20250505-0006%20Atkinson%20Hyperlegible.png)
    
      
    

**Nota:** Es posible que haya alguna otra fuente proporcional que tenga este arreglo pero todavía no se de ello.  

* * *

> 💬 _Así como elegimos la herramienta adecuada para cada tarea, también debemos elegir una tipografía que nos permita trabajar con claridad y sin confusiones innecesarias. A veces, una simple barra en el número cero puede ahorrarnos muchos dolores de cabeza._

### Sobre la letra "l" ele que se parece a un uno o un palito  

Esta se parece a un uno o peor aún a una [pleca](https://es.wikipedia.org/wiki/Pleca) "|" en Synaptic, ejemplo en el texto del paquete:

libreoffice-l10n-es  

[![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjIikfA0bV4n2S3Y2MVlrYqTE1WVbko8jJrZ_nvBsSpOFMi_g-v_eFgGivvJUzr-MlMl-miApuXnT5ExUi9IRyIL13DIvVIRG126-k3QGrCnl1vcZasK9dVUVyQqDz2LYKyOLLNVhrWQVeEmd3ZDShoDf_vPUvNgN9xKfbBcfM46pxRbAjPKWawVSdFHU/s16000-rw/20250512-0001%20la%20ele%20vista%20en%20Synaptic%20en%20un%20nombre.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjIikfA0bV4n2S3Y2MVlrYqTE1WVbko8jJrZ_nvBsSpOFMi_g-v_eFgGivvJUzr-MlMl-miApuXnT5ExUi9IRyIL13DIvVIRG126-k3QGrCnl1vcZasK9dVUVyQqDz2LYKyOLLNVhrWQVeEmd3ZDShoDf_vPUvNgN9xKfbBcfM46pxRbAjPKWawVSdFHU/s952/20250512-0001%20la%20ele%20vista%20en%20Synaptic%20en%20un%20nombre.png)

ejemplos como estos son importantes porque imagínensen uno quiere buscar en Synaptic algún paquete y no se pueda distinguir bien qué letra es una de sus letras, eso está mal

les cuento que en el mes de Abril de 2025 tuve la oportunidad de ver a una amistad poner en un celular **iPhone** una contraseña que contenía cero, y usaba una fuente tipográfica que tenía en los ceros una barra diagonal, esto me parece excelente, eso es algo bien pesando, así debería ser en todos los teléfonos y en todos los ordenadores en todos los lugares donde uno vea números y también letras, creo que nunca debería haber la posibilidad de que alguien se equivoque en saber qué número o letra es. 

Les cuento que estoy usando la fuente tipográfica proporcional Atkinson Hyperlegible en el sistema operativo (y sus programas)

# Herramientas para probar fuentes fácilmente  

Aconsejo usar Sitios web como [https://fontdrop.info/](https://fontdrop.info/) o [https://www.fontsquirrel.com/tools/webfont-generator](https://www.fontsquirrel.com/tools/webfont-generator)   los cuales permiten subir fuentes y ver cómo lucen en pantalla, además de otras informaciones:

**Fontdrop.info**



### Para reflexionar:  

"Por nuestra parte, a nadie damos motivo alguno de tropiezo, para que no se desacredite nuestro servicio." 2 Corintios 6:3 NVI

 Dios les bendiga  

**CONSULTAS**

**Font where O is very distinct from zero**  
[https://graphicdesign.stackexchange.com/questions/93337/font-where-o-is-very-distinct-from-zero](https://graphicdesign.stackexchange.com/questions/93337/font-where-o-is-very-distinct-from-zero)

**Make 'O' and '0' glyphs more easily distinguishable. #20  
**[https://forums.linuxmint.com/viewtopic.php?t=288145](https://forums.linuxmint.com/viewtopic.php?t=288145)

**“Slashed zero” font recommendations - SOLVED  
**[https://forums.linuxmint.com/viewtopic.php?t=288145](https://forums.linuxmint.com/viewtopic.php?t=288145)













