# No funcionan las teclas de Brillo F11 / F12 de laptop en Debian 12 Netinstall CD con LXQT

Después de instalar Debian 12 Netinstall CD con LXQt **(esta entrada de este tutorial es sólo para este Sistema Operativo, otros no deberían tener ningún problema)** en la laptop Dell Inspiron 14 3481 las teclas de brillo de la pantall (**F11/F12**) no funcionan:

[https://dl.dell.com/topicspdf/inspiron-14-3481-laptop_users-guide_es-mx.pdf](https://dl.dell.com/topicspdf/inspiron-14-3481-laptop_users-guide_es-mx.pdf)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiZSQ42oRngPd2Sbn1-Ruj7EhLmD7ghXhv7elp7Q8J2FDvgq06FJowq08kb0fgADge4-nhIfgcMd0ykDMF0YC-Eho6aNKMz2vhMqFwtCh1lDsFotWnlsoUE3vbG4spksw1CBMnzsQ-guUJ9Ybh20RSx_ySwazGRUaKrhJqv3RS-l7mt84yq1ZjS6oSGOpE/s16000/20250716-211721%20teclas%20de%20control%20de%20brillo%20en%20Laptop%20Dell%20Inspiron%203481.png)

**Nota:** Allí en el manual dice que en la BIOS se puede cambiar el uso con Fn.

La solución implica instalar `light` y configurar los atajos manualmente.

## 📌 Pasos para Solucionar el Problema

### **1️⃣ Instalar los Paquetes Necesarios**
Abre una terminal y ejecuta:

```bash
sudo apt update && sudo apt upgrade
sudo apt install lxqt-powermanagement light
```

- `lxqt-powermanagement`: Gestión de energía para LXQt (puede que ya esté instalado).
- `light`: Control de brillo de pantalla.

### **2️⃣ Dar Permisos al Usuario para Controlar el Brillo**
Añade tu usuario al grupo `video` (de lo contrario tendríamos que usar `sudo` con `light`):

```bash
sudo usermod -aG video $USER
```
**Reinicia la sesión** (cierra y vuelve a entrar).

### **3️⃣ Verificar que `light` Funciona**
Prueba estos comandos (uno por uno):

```bash
light -A 5  # Aumenta brillo en 5%
light -U 5  # Reduce brillo en 5%
```
cada uno de ellos aumenta o baja el brillo muy poco por lo que debes usalos varias veces, y para repetir el comando rapido en la terminal una vez que uno de ellos haya sido ejecutado sólo aplasta la fecla arriba (del teclado)

Si funcionan, podemos asignarlos a las teclas **F11** y **F12**.

### **4️⃣ Configurar los Atajos de Teclado en LXQt**
1. **Abre el configurador de atajos de teclado:**  
   Ejecuta en terminal:

```bash
lxqt-config-globalkeyshortcuts
```

   O búscalo en el menú:  
   **Menú LXQt → Preferencias → Configuración de LXQt → Atajos de teclado**.

2. **Eliminar atajos conflictivos (si existieran):**  
   - Busca entradas relacionadas con `brightness` o `backlight`.  
   - Si existen, elimínalas o desactívalas.

3. **Añadir nuevos atajos:**  
   Haz clic en **"Añadir"** (o "Add").  
   
   - **Para F12 (Subir brillo):**  
     - **Atajo:** Da clic y presiona la Tecla `F12` (automaticamente se pondrá un comando)
     - **Descripción** poner `Subir brillo`
     - **Comando:** marcar comando y poner `light -A 5`  y Aceptar

     
   - **Para F1 (Bajar brillo):**  
     - **Atajo:** Da clic y presiona la Tecla `F11` (automaticamente se pondrá un comando)
     - **Descripción** poner `Bajar brillo`
     - **Comando:** marcar comando poner `light -U 5` y Aceptar


4. **Guardar y probar:**  
   - Cierra la ventana y prueba las teclas **F11/F12**.

### **5️⃣ Solución Alternativa si `light` No Funciona**
Si lo ha hecho bien deberá funcionar, pero sino, si `light` no responde, instala `brightnessctl`:

```bash
sudo apt install brightnessctl
```

Luego configura los atajos con:

- **F11 (Subir):** `brightnessctl set +5%`  
- **F12 (Bajar):** `brightnessctl set 5%-`  

Dios les bendiga