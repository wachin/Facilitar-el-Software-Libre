

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

