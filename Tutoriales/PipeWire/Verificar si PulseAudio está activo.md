

Para comprobar si PulseAudio está activo:

```bash
pactl info
```

Este comando muestra información del servidor PulseAudio. Si ves cosas como:

```
Nombre del servidor: pulseaudio
Versión del servidor: ...(Ejemplo: 16.1)
Destino por defecto: : ...(Ejemplo: alsa_input.pci-0000_00_1f.3.analog-stereo)
```

Entonces **PulseAudio está funcionando**.

Si, por el contrario, te dice:

```
Connection refused
```

Significa que **no está corriendo o hay un problema**.

---

## 🛠️ Solución rápida si no funciona

Si después de `pulseaudio --start` aún no se inicia, prueba reiniciarlo así:

```bash
pulseaudio --kill
pulseaudio --start
```

Y luego otra vez:

```bash
pactl info
```

---

## 💡 Recomendaciones adicionales

1. **Abre pavucontrol** para ver si detecta dispositivos:

   ```bash
   pavucontrol
   ```

2. **Verifica las salidas de audio:**

   ```bash
   pactl list short sinks
   ```

   Si no aparece nada, puede haber un problema con los controladores o permisos.

3. **Reinstala PulseAudio por si acaso (opcional):**

   ```bash
   sudo apt install --reinstall pulseaudio
   ```

4. **Asegúrate de no tener PipeWire activo**, porque podría estar interfiriendo (como viste antes).

---

¿Quieres probar ahora si suena el audio? Puedes usar:

```bash
speaker-test -c 2 -twav
```

O también:

```bash
aplay /usr/share/sounds/alsa/Front_Center.wav
```

---

¿Te gustaría que revisemos algún log específico o prefieres probar primero si el audio funciona?
