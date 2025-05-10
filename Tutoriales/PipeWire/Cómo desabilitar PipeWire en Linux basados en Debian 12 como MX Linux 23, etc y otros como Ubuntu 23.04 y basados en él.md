# Cómo desabilitar PipeWire en Linux basados en Debian 12 como MX Linux 23, etc y otros como Ubuntu 23.04 y basados en él.md

En Distribuciones Linux basados en Debian 12 como MX Linux 23, antiX 23 u otros como Ubuntu 23.04 lanzados aproximadamentes en el 2023 es posible que vengan con PipeWire en vez de PulseAudio, si usted como yo desea desabilitar PipeWire para habilitar PulseAudio y usarlo en conjunto con QjackCtl hacer lo siguiente

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

3. **Instalar pulseaudio**

```bash
sudo apt install pulseaudio
```

3. **Reiniciar PulseAudio**:

   ```bash
   pulseaudio --start
   ```

4. **Abrir JACK**

```bash
    qjackctl &
```

---

Pero al grabar un audio desde el microfono con Audacity me sale un mensaje que dice que se han perdido las etiquetas porque se está tratando de grabar en un dispositivo muy lento, lo cual efectivamente es así, pues estoy usando Linux Debian 12 instalado en un pendrive SanDisk y no en un disco de estado sólido ni un disco duro
