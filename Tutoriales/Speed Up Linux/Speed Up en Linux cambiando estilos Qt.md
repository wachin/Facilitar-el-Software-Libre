# Cómo hacer que tu sistema Linux vaya más rápido cambiando el estilo de las aplicaciones Qt con **qt5ct**

## 🎯 Objetivo

Aprenderás a configurar el **estilo visual** de los programas basados en **Qt5** (como VLC, qBittorrent, VirtualBox, etc.) para que usen **menos recursos** y así el sistema operativo funcione más rápido y ligero.

---

## 1. ¿Qué es Qt y por qué importa el estilo?

* Muchos programas de Linux están hechos con la librería **Qt**.
* Qt permite cambiar la apariencia de los programas usando **estilos (themes)**.
* Algunos estilos usan **gráficos complejos, sombras y animaciones** → más bonitos, pero más **pesados**.
* Otros estilos son **simples y básicos** → menos bonitos, pero más **rápidos y ligeros**.

👉 Al elegir un estilo ligero, el sistema consume **menos CPU y memoria RAM**, lo que mejora el rendimiento.

---

## 2. Instalar la herramienta Qt5 y dependencias

En Debian 12 ya existe el paquete qt5ct y además las demás paquetes necesarios. Abre la terminal y escribe:

```bash
sudo apt install qt5ct kde-style-qtcurve-qt5 qt5-style-plugin-cleanlooks
qt5-style-plugin-motif qt5-style-plugin-plastique qt5-style-plugins libkf5style5 qt5-styles-ukui qtcurve
```

Esto instala el programa **Qt5 Configuration Tool**.

---

## 3. Configurar qt5ct utilidad de configuración de Qt5 en fluxbox, openbox

Si usas ejemplo FluxBox o Openbox u otro gestor de ventanas minimalista X11 en un sisema operativo ejemplo MX Linux 23 XFCE esto es necesario para las aplicaciones que han sido escritas en Qt (KDE) como por ejemplo Dolphin, Kate, etc puedan elegir los iconos y temas de ellas

Ponga en una terminal:

```bash
echo "export QT_QPA_PLATFORMTHEME="qt5ct"" >> ~/.profile
```

con esto hemos añadido esa última línea al archivo oculto .profile

**Nota: **Esto funciona al cerrar sesión y volver a entrar en la sesión del WM x11 minimalista

---

## 4. Abrir la herramienta

Después de reiniciar, abre el menú de aplicaciones y busca:
👉 **Ajustes Qt5** o **qt5ct**

Se abre una ventana donde puedes elegir el estilo visual.

---

## 5. Probar estilos ¿Qué estilo elegir?

En la pestaña **"Appearance"** da clic en **"Estilo"** y verás una lista de **Estilos**:

|     Estilo     |  Recursos usados   |       Velocidad        |       Apariencia       |
| -------------- | ------------------ | ---------------------- | ---------------------- |
| **Motif**      | Muy bajos          | 🚀 Rápido              | Muy simple             |
| **CDE**        | Muy bajos          | 🚀 Rápido              | Muy simple             |
| **Plastique**  | Bajos              | 🚀 Rápido              | Clásico Qt             |
| **GTK2**       | Bajos              | 🚀 Rápido              | Clásico Qt             |
| **Cleanlooks** | Bajos              | 🚀 Rápido              | Un poco más moderno    |
| **Windows**    | Bajos              | 🚀 Rápido              | Simple, estilo Windows |
| **Fusion**     | Medios             | ⚡ Normal               | Moderno y limpio       |
| **QtCurve**    | Depende del tema   | ⚡ Variable             | Personalizable         |
| **Breeze**     | Más altos          | 🐢 Lento en PCs viejas | Moderno KDE            |
| **Oxygen**     | Altos              | 🐢 Lento en PCs viejas | Muy bonito             |
| **Kvantum**    | Altos (según tema) | 🐢 Lento en PCs viejas | Estilo avanzado        |
| **UKUI**       | Altos (según tema) | 🐢 Lento en PCs viejas | Estilo avanzado        |

* Si tu PC es **vieja o lenta** → usa **Motif, CDE, Plastique, GTK2, Cleanlooks o Windows,**.
* Si tu PC es **moderna** → puedes usar **Fusion**, **QtCurve** o **Breeze** sin problemas.
* Si quieres **lo más bonito posible** y no te importa gastar más recursos → usa **Oxygen, UKUI o Kvantum**.

---

## 6. Conclusión

* Cambiar el **estilo Qt** es como elegir entre un coche de lujo con muchos extras (bonito pero pesado) o un coche sencillo (más rápido y práctico).
* En computadoras con **pocos recursos**, elegir un estilo ligero como **Motif** o **Plastique** puede mejorar bastante la rapidez del sistema.

---

📌 **RESUMEN:**

1. Instala `qt5ct` en tu Debian.
2. Cambia el estilo a **Motif** y abre un programa Qt (ej. VLC).
3. Luego cámbialo a **Oxygen** y compara el uso de memoria en **htop** o rapidamente con el comando  `free -h` (con los mismos programas abiertos)






