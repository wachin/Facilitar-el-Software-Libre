# **Tutorial: Configurar Teclas de Brillo (F11/F12) en LXQt (Debian/Lubuntu)**

**Problema:**  
Después de instalar Debian 12 Netinstall CD con LXQt en la laptop Dell Inspiron 14 3481 las teclas de brillo de la pantall (**F11/F12**) no funcionan. La solución implica instalar `light` y configurar los atajos manualmente.

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
Prueba estos comandos:
```bash
light -A 5  # Aumenta brillo en 5%
light -U 5  # Reduce brillo en 5%
```

cada uno de ellos aumenta o baja el brillo muy poco por lo que usalos varias veces, para repetir el comando rapido en la terminal una vez que uno de ellos haya sido ejecutado sólo aplasta la fecla arriba (del teclado)

Si funcionan, podemos asignarlos a las teclas **F11** y **F12**.

---

### **4️⃣ Configurar los Atajos de Teclado en LXQt**
1. **Abre el configurador de atajos de teclado:**  
   Ejecuta en terminal:
   ```bash
   lxqt-config-globalkeyshortcuts
   ```
   O búscalo en el menú:  
   **Menú LXQt → Preferencias → Configuración de LXQt → Teclado → Atajos de teclado**.

2. **Eliminar atajos conflictivos (si existen):**  
   - Busca entradas relacionadas con `brightness` o `backlight`.  
   - Si existen, elimínalas o desactívalas.

3. **Añadir nuevos atajos:**  
   - Haz clic en **"Añadir"** (o "Add").  
   - **Para F11 (Subir brillo):**  
     - **Nombre:** `Subir Brillo`  
     - **Comando:** `light -A 5`  
     - Haz clic en **"Tecla"** y presiona **F11**.  
   - **Para F12 (Bajar brillo):**  
     - **Nombre:** `Bajar Brillo`  
     - **Comando:** `light -U 5`  
     - Haz clic en **"Tecla"** y presiona **F12**.  

4. **Guardar y probar:**  
   - Cierra la ventana y prueba las teclas **F11/F12**.

---

### **5️⃣ Solución Alternativa si `light` No Funciona**
Si `light` no responde, instala `brightnessctl`:
```bash
sudo apt install brightnessctl
```
Luego configura los atajos con:
- **F11 (Subir):** `brightnessctl set +5%`  
- **F12 (Bajar):** `brightnessctl set 5%-`  

---

## **📝 Publicar en tu Blog (Formato Blogger)**
### **Título:**  
**"Cómo Configurar las Teclas de Brillo (F11/F12) en LXQt (Debian/Lubuntu)"**  

### **Contenido del Post:**  
```markdown
¿Las teclas de brillo (F11/F12) no funcionan en LXQt? Sigue esta guía para solucionarlo.

### **📌 Requisitos**
- Tener LXQt instalado (Debian, Lubuntu o derivados).
- Terminal abierta (Ctrl+Alt+T).

### **🛠️ Solución Paso a Paso**
1. **Instalar los paquetes necesarios:**
   ```bash
   sudo apt install lxqt-powermanagement light
   ```
2. **Añadir tu usuario al grupo `video`:**
   ```bash
   sudo usermod -aG video $USER
   ```
   Reinicia la sesión.
3. **Configurar atajos de teclado:**
   - Abre `lxqt-config-globalkeyshortcuts`.
   - Añade:
     - **F11:** `light -A 5` (Subir brillo).
     - **F12:** `light -U 5` (Bajar brillo).
4. **Alternativa con `brightnessctl`:**
   ```bash
   sudo apt install brightnessctl
   ```
   Usa `brightnessctl set +5%` y `brightnessctl set 5%-`.

✅ ¡Listo! Las teclas de brillo deberían funcionar.  
¿Tienes dudas? Déjalas en los comentarios. 👇
```

---

## **🔹 Conclusión**
- **`light` + `lxqt-powermanagement`** es la mejor opción para controlar el brillo en LXQt.  
- Si no funciona, prueba con **`brightnessctl`**.  
- Configura los atajos manualmente en **`lxqt-config-globalkeyshortcuts`**.  

¡Espero que esta guía sea útil para tu blog! 🚀 Si necesitas más detalles, dime.