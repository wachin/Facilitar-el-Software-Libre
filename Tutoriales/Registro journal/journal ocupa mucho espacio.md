

> journal ocupa mucho espacio

En Linux Debian (y en otras distribuciones basadas en systemd), la carpeta `/var/log/journal/` contiene los archivos de registro binarios de `systemd-journald`, el demonio que se encarga de registrar eventos del sistema. Estos archivos registran una amplia variedad de eventos del sistema, incluyendo mensajes del kernel, servicios, aplicaciones, y otros componentes del sistema. Estos registros son útiles para diagnóstico, auditoría y monitoreo del sistema.

### Por qué puede ocupar mucho espacio
El tamaño de la carpeta `/var/log/journal/` puede crecer debido a la cantidad de eventos registrados, la retención de registros antiguos, y la configuración del tamaño máximo permitido para los archivos de registro. Si el sistema genera muchos eventos o si los registros se mantienen durante un largo período, esta carpeta puede llegar a ocupar una cantidad significativa de espacio en disco.

### Cómo reducir el tamaño de `/var/log/journal/`
Puedes reducir el tamaño de esta carpeta de varias maneras:

1. **Configurar la retención de registros**:
   - Abre el archivo de configuración `/etc/systemd/journald.conf` con un editor de texto como root.
   - Busca o añade las siguientes líneas y ajusta los valores según tus necesidades:

     ```ini
     [Journal]
     SystemMaxUse=100M
     SystemKeepFree=50M
     SystemMaxFileSize=10M
     ```

     - `SystemMaxUse`: Especifica el tamaño máximo total que los registros pueden ocupar en el disco.
     - `SystemKeepFree`: Especifica cuánto espacio libre debe mantener en el disco antes de comenzar a eliminar registros antiguos.
     - `SystemMaxFileSize`: Especifica el tamaño máximo de cada archivo de registro.

   - Después de hacer cambios, reinicia el servicio `systemd-journald` para que los cambios surtan efecto:

     ```bash
     sudo systemctl restart systemd-journald
     ```

2. **Eliminar manualmente registros antiguos**:
   Si necesitas liberar espacio inmediatamente, puedes eliminar registros antiguos manualmente con el siguiente comando:

   ```bash
   sudo journalctl --vacuum-size=100M
   ```

   Este comando reducirá el tamaño de los registros a 100 MB. Puedes ajustar el valor a lo que consideres adecuado.

3. **Deshabilitar el registro persistente**:
   Si no necesitas conservar registros a largo plazo, puedes deshabilitar el registro persistente, lo que hará que los registros se almacenen en `/run/log/journal/` (que se limpia en cada reinicio):

   - Para deshabilitar el registro persistente, abre `/etc/systemd/journald.conf` y cambia la configuración:

     ```ini
     [Journal]
     Storage=volatile
     ```

   - Reinicia el servicio `systemd-journald`:

     ```bash
     sudo systemctl restart systemd-journald
     ```

   **Nota:** Esto significa que los registros se perderán después de cada reinicio.

### Conclusión
El tamaño de la carpeta `/var/log/journal/` se puede gestionar configurando los parámetros de `systemd-journald` para limitar el tamaño de los registros. Si necesitas más espacio, puedes vaciar registros antiguos o incluso deshabilitar el registro persistente si no necesitas conservar los registros entre reinicios.