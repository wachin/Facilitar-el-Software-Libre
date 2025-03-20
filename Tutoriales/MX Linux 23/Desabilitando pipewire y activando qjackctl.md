

## **¿Y si quiero usar JACK sin PipeWire?**
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

3. **Reiniciar PulseAudio y JACK**:

    ```bash
    pulseaudio --start
    qjackctl &
    ```

---

### **Conclusión**
- Si quieres un sistema moderno como **Ubuntu Studio**, usa **PipeWire con `pw-jack`**.
- Si prefieres la configuración clásica de **Debian 11**, **desactiva PipeWire** y usa JACK con PulseAudio como antes.

🔹 **¿Qué prefieres hacer?**