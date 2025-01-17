


# Tutorial: Sincronización Rápida de Múltiples Repositorios Git

Este tutorial explica cómo configurar y usar scripts personalizados para sincronizar rápidamente múltiples repositorios Git con GitHub antes de apagar tu ordenador.

## Requerimientos

Necesitas:

- Debian 12
- Dolphin
- Konsole
- nnn

## Configuración Inicial

Para cada repositorio, necesitarás crear dos scripts:

1. `Script_nnn_open_auto-push-script-2.sh`
2. `auto-push-script-2.sh`

### Script 1: Script_nnn_open_auto-push-script-2.sh

```bash
#!/bin/sh
konsole -p tabtitle='PFSLE' -e nnn "auto-push-script-2.sh"
```

### Script 2: auto-push-script-2.sh

```bash
#!/bin/bash
### Auto push script
echo "Agregando cambios al stage..."
git add .
echo "Realizando commit..."
git commit -m "Actualización $(date)"
echo "Enviando cambios al repositorio remoto..."
git push origin main
echo "Proceso finalizado."
read
```

**Nota**: Asegúrate de dar permisos de ejecución a ambos scripts.

## Estructura de Directorios

Ejemplo para dos repositorios:

```
/home/wachin/Dev/
├── Facilitar-el-Software-Libre/
│   ├── auto-push-script-2.sh
│   └── Script_nnn_open_auto-push-script-2.sh
└── Cancionero/
    ├── auto-push-script-2.sh
    └── Script_nnn_open_auto-push-script-2.sh
```

## Proceso de Sincronización

1. Abre Konsole
2. Navega al directorio del repositorio
3. Añade el directorio a los marcadores de Konsole
4. Activa "Mostrar las órdenes rápidas":
   - Ve a "Complementos"
   - Marca la casilla "Mostrar las órdenes rápidas"
5. En el panel de órdenes rápidas:
   - En "Orden", escribe: `nnn "auto-push-script-2.sh"`
   - Haz clic en "Ejecutar"
6. En nnn, selecciona `auto-push-script-2.sh` y presiona Enter

## Uso Diario

1. Abre una instancia de Konsole
2. Usa los marcadores para navegar a cada repositorio en nuevas pestañas
3. En cada pestaña, ejecuta: `nnn "auto-push-script-2.sh"`
4. Selecciona el script en nnn y presiona Enter para ejecutarlo

Este método te permite sincronizar rápidamente múltiples repositorios sin tener que escribir manualmente los comandos de Git cada vez.

**Nota**: Este método es ideal para repositorios personales donde eres el único colaborador y no hay riesgo de conflictos. Para proyectos colaborativos, se recomienda un proceso de revisión más detallado antes de hacer push.

