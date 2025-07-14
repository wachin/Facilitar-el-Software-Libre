# Configuración de Sway y Wayland para 75Hz en monitor externo

Para lograr que tu monitor ViewSonic funcione a 75Hz en Sway/Wayland, hay algunas diferencias importantes respecto a X11:

## Diferencia entre X11 y Wayland

En Wayland (que usa Sway), el comando `xrandr` no funciona porque es específico de X11. En su lugar, debes usar `wlr-randr` (que ya instalaste).

## Script adaptado para Wayland/Sway

El equivalente a tu script X11 sería:

```bash
#!/bin/bash

# Primero verifica las resoluciones disponibles con:
# wlr-randr

# Luego configura la salida
wlr-randr --output HDMI-1 --mode 1368x768@75.00
```

## Posibles problemas

1. **Modo no disponible**: Es posible que el modo 1368x768@75.00 no esté disponible directamente. Puedes ver los modos disponibles con:
   ```bash
   wlr-randr
   ```

2. **Creación de modos personalizados**: Si necesitas crear un modo personalizado como hacías en X11, en Wayland es diferente. Puedes probar con:
   ```bash
   wlr-randr --output HDMI-1 --custom-mode 1368x768@75.00
   ```

3. **Compatibilidad del monitor**: Verifica que tu monitor realmente soporta 75Hz en esa resolución.

## Configuración permanente

Para que la configuración persista en Sway, debes agregarla a tu archivo de configuración de Sway (normalmente `~/.config/sway/config`):

```
output HDMI-1 mode 1368x768@75.00
```

## Verificación

Después de aplicar los cambios, verifica la frecuencia de actualización con:
```bash
wlr-randr | grep -A 10 "HDMI-1"
```

Nota: Se podría necesitar investigar sobre `wayland-modeline` para crear modos personalizados en Wayland,
