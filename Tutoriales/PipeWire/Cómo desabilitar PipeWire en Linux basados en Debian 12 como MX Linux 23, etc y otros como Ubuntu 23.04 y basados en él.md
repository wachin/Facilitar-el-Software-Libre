# Cómo desabilitar PipeWire en Linux basados en Debian 12 como MX Linux 23, etc y otros como Ubuntu 23.04 y basados en él.md

En Distribuciones Linux basados en Debian 12 como MX Linux 23, antiX 23 u otros como Ubuntu 23.04 lanzados aproximadamentes en el 2023 es posible que vengan con PipeWire en vez de PulseAudio, si usted como yo desea deshabilitar PipeWire para habilitar PulseAudio y usarlo en conjunto con QjackCtl hacer lo siguiente

## Usar JACK sin PipeWire en Debian 12, MX Linux 23

Si prefieres el método antiguo (como en Debian 11), puedes **deshabilitar PipeWire y usar JACK directamente**:

Desinstalar:

```bash
sudo apt remove pipewire-audio-client-libraries pipewire-jack
```

1. **Deshabilitar PipeWire**:

   ```bash
   systemctl --user stop pipewire pipewire-pulse wireplumber
   systemctl --user disable pipewire pipewire-pulse wireplumber
   ```

2. **Enmascarar PipeWire para que no se active**:

   ```bash
   systemctl --user mask pipewire pipewire-pulse wireplumber
   ```

3. **Opcional: Limpiar configuraciones residuales**

Si quieres dejar el sistema limpio, podrías borrar las configuraciones locales de audio del usuario:

```bash
rm -rf ~/.config/pipewire/
rm -rf ~/.config/wireplumber/
```

> ⚠️ Esto eliminará cualquier ajuste personalizado, pero ayuda a evitar problemas si PipeWire había estado activo antes.



4. Para **verificar si PulseAudio está funcionando correctamente** en MX Linux 23 (o cualquier sistema basado en Debian/Ubuntu con PulseAudio), puedes usar los siguientes comandos:

---

🔍 4.1. **Verificar si PulseAudio está corriendo:**

```bash
pulseaudio --check
```

- Si devuelve silencio y código de salida `0`, significa que PulseAudio está configurado correctamente.
- Si no está corriendo, puedes iniciarlo con:

```bash
pulseaudio --start
```

---

📋 4.2. **Listar dispositivos de audio reconocidos:**

```bash
pactl info
```

Esto muestra información general sobre el servidor PulseAudio, incluyendo el **servidor actual**, el **usuario**, el **estado del daemon**, y el **dispositivo de salida predeterminado**.

---

 🎧 4.3. **Verificar la salida de audio:**

```bash
pactl list short sinks
```

Te muestra las "salidas de audio" disponibles (por ejemplo, altavoces, auriculares). Deberías ver al menos una salida activa.

---

👂 4.4. **Verificar entradas de audio (micrófonos):**

```bash
pactl list short sources
```

Muestra los dispositivos de entrada de audio (micrófonos).

---

🔄 4.5. **Reiniciar PulseAudio (útil para resolver problemas temporales):**

```bash
pulseaudio --kill && pulseaudio --start
```

Este comando mata el proceso actual de PulseAudio y lo reinicia.

---

🧰 4.6. **Opcional: Abrir control de volumen avanzado**

```bash
pavucontrol
```

Si tienes instalado `pavucontrol` (PulseAudio Volume Control), te permite ajustar niveles de sonido, dispositivos de entrada/salida, perfiles, etc., desde una interfaz gráfica.

---

### ✅ Resumen rápido de comandos útiles

| Comando | Descripción |
|--------|-------------|
| `pulseaudio --check` | Verifica si PulseAudio está configurado |
| `pulseaudio --start` | Inicia PulseAudio |
| `pulseaudio --stop` | Detiene PulseAudio |
| `pulseaudio --kill` | Mata el proceso actual de PulseAudio |
| `pactl info` | Información general del estado de PulseAudio |
| `pactl list short sinks` | Lista salidas de audio |
| `pactl list short sources` | Lista entradas de audio (micrófonos) |
| `pavucontrol` | Panel de control gráfico de audio |

---

5. **Instalar pulseaudio qjackctl y los demás paquetes y configuraciones**

Por favor sigue el siguiente tutorial para instalar todo lo necesario

**Cómo instalar y usar Jack Audio Connection Kit (JACK) + Ardour y sus plugins con un Kernel de Tiempo Real en MX Linux 21 (basado en Debian 11)**   
[https://facilitarelsoftwarelibre.blogspot.com/2020/10/instalar-realtime-kernel-en-mx-linux.html](https://facilitarelsoftwarelibre.blogspot.com/2020/10/instalar-realtime-kernel-en-mx-linux.html)  


