

desinstalar:

libreoffice-gtk3

que por cierto en Debian 12 está instalado el paquete libreoffice-qt5 que necesitamos, ahora poner:



SAL_USE_VCLPLUGIN=qt5 libreoffice



# 🌱 Tutorial: Cómo hacer que tu sistema vaya más rápido cambiando el estilo de las aplicaciones Qt con **qt5ct**

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

## 2. Instalar la herramienta

En Debian 12 ya existe el paquete. Abre la terminal y escribe:

```bash
sudo apt install qt5ct
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
👉 **Qt5 Settings** o **Qt5 Configuration Tool (qt5ct)**

Se abre una ventana donde puedes elegir el estilo visual.

---

## 5. Probar estilos

En la pestaña **"Appearance"** verás una lista de estilos como:

* **Motif** (muy rápido y ligero)
* **CDE** (básico y ligero)
* **Plastique / Cleanlooks** (clásicos y rápidos)
* **Fusion** (balance entre simple y moderno)
* **Breeze / Oxygen / Kvantum** (bonitos pero pesados)

Selecciona uno, aplica los cambios y abre un programa como **VLC o qBittorrent** para ver la diferencia.

---

## 6. ¿Qué estilo elegir?

* Si tu PC es **vieja o lenta** → usa **Motif, CDE, Plastique o Cleanlooks**.
* Si tu PC es **moderna** → puedes usar **Fusion** o **Breeze** sin problemas.
* Si quieres **lo más bonito posible** y no te importa gastar más recursos → usa **Oxygen o Kvantum**.

💡 Ejemplo práctico:
En una laptop antigua con 2 GB de RAM, usar **Motif** hará que el sistema se sienta mucho más rápido que con **Oxygen**.

---

## 7. Comparación de consumo

| Estilo         | Recursos usados    | Velocidad              | Apariencia             |
| -------------- | ------------------ | ---------------------- | ---------------------- |
| **Motif**      | Muy bajos          | 🚀 Rápido              | Muy simple             |
| **CDE**        | Muy bajos          | 🚀 Rápido              | Muy simple             |
| **Plastique**  | Bajos              | 🚀 Rápido              | Clásico Qt             |
| **Cleanlooks** | Bajos              | 🚀 Rápido              | Un poco más moderno    |
| **Windows**    | Bajos              | 🚀 Rápido              | Simple, estilo Windows |
| **Fusion**     | Medios             | ⚡ Normal               | Moderno y limpio       |
| **QtCurve**    | Depende del tema   | ⚡ Variable             | Personalizable         |
| **Breeze**     | Más altos          | 🐢 Lento en PCs viejas | Moderno KDE            |
| **Oxygen**     | Altos              | 🐢 Lento en PCs viejas | Muy bonito             |
| **Kvantum**    | Altos (según tema) | 🐢 Lento en PCs viejas | Estilo avanzado        |

---

## 8. Conclusión

* Cambiar el **estilo Qt** es como elegir entre un coche de lujo con muchos extras (bonito pero pesado) o un coche sencillo (más rápido y práctico).
* En computadoras con **pocos recursos**, elegir un estilo ligero como **Motif** o **Plastique** puede mejorar bastante la rapidez del sistema.

---

📌 **Ejercicio para los experimentar:**

1. Instala `qt5ct` en tu Debian.
2. Cambia el estilo a **Motif** y abre un programa Qt (ej. VLC).
3. Luego cámbialo a **Oxygen** y compara el uso de memoria en **htop** o rapidamente con el comando  `free -h` (con los mismos programas abiertos)






