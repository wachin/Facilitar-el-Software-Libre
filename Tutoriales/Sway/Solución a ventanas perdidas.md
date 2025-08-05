# Solución a problemas de ventanas perdidas en Sway

## El Problema

Si usas Sway (el compositor de ventanas para Wayland) y te encuentras en esta situación:

- Tienes varias ventanas abiertas en modo flotante
- Una ventana se maximiza o va a pantalla completa (como gwenview al abrir una imagen)
- Cambias esa ventana a modo flotante con `Mod + Shift + Espacio`
- Las otras ventanas "desaparecen" detrás y no puedes acceder a ellas
- `Alt + Tab` no funciona para cambiar entre ventanas

**¡No te preocupes!** Tus ventanas siguen ahí, solo están ocultas. Este tutorial te enseñará cómo recuperarlas y evitar que vuelva a pasar.

## Soluciones Inmediatas

### Método 1: Navegación con teclado
Usa las teclas de dirección para moverte entre ventanas:

- `Mod + ←`   Enfocar ventana a la izquierda
- `Mod + →`   Enfocar ventana a la derecha  
- `Mod + ↑`  #Enfocar ventana arriba
- `Mod + ↓`    Enfocar ventana abajo

- `Mod + Shift + flechas` → Mover ventana a otra dirección.  

**Alternativa con teclas vim:**

- `Mod + h`  Izquierda
- `Mod + l`  Derecha
- `Mod + k`  Arriba
- `Mod + j`  Abajo

### Alternar entre ventanas flotantes y en mosaico

`Mod + Ctrl + Espacio`  Cambiar foco entre ventanas flotantes y tiling

## Configuración Recomendada

Para evitar este problema en el futuro, agrega estas líneas a tu archivo `~/.config/sway/config`:

```
# Alternar entre ventanas flotantes y tiling más fácilmente
bindsym $mod+ctrl+space focus mode_toggle

# Traer ventana flotante al frente y enfocarla
bindsym $mod+shift+f floating toggle, focus

# Navegación mejorada entre ventanas
bindsym $mod+tab focus next
bindsym $mod+shift+tab focus prev

# Cambiar rápidamente entre modos de ventana
bindsym $mod+shift+w layout tabbed
bindsym $mod+shift+e layout toggle split
bindsym $mod+shift+s layout stacking
```

Después de agregar estas líneas, recarga la configuración:
```
Mod + Shift + c
```

## Consejos Adicionales

### Gestión Preventiva
- **Usa workspaces:** `Mod + [1-9]` para cambiar entre espacios de trabajo
- **Organiza por tipo:** Terminales en workspace 1, navegador en 2, etc.
- **Modo picture-in-picture:** `Mod + Shift + Espacio` seguido de redimensionar con `Mod + r`

### Si nada funciona
Como último recurso, puedes reiniciar Sway sin perder tu trabajo:
```
Mod + Shift + e  # Menú de salida
```
Selecciona "Reload" en lugar de "Exit".

## Flujo de Trabajo Recomendado

1. **Abre aplicaciones en orden:** Primero las que usarás como base (terminales, editor)
2. **Usa workspaces:** Separa aplicaciones por función
3. **Modo flotante solo cuando sea necesario:** La mayoría del tiempo, el modo tiling es más eficiente
4. **Aprende los atajos:** Memoriza `Mod + w`, `Mod + e`, `Mod + s` para cambios rápidos de layout

## Troubleshooting

**Si las ventanas siguen sin aparecer:**
- Verifica que no estén minimizadas: `Mod + Shift + minus` para minimizar/restaurar
- Revisa si están en otro workspace: `Mod + [número]`
- Usa `swaymsg -t get_workspaces` para ver todos los espacios de trabajo activos

**Si Alt + Tab definitivamente no funciona:**
- Instala un switcher alternativo como `wofi` o `rofi`
- O usa los atajos nativos de Sway mencionados arriba

## Conclusión

Los gestores de ventanas como Sway requieren un poco de curva de aprendizaje, pero una vez que dominas estos comandos básicos, la productividad aumenta significativamente. La clave está en entender que las ventanas no desaparecen, solo cambian de contexto, y siempre hay una forma de navegar de vuelta a ellas.
