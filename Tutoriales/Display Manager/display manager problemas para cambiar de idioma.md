

# Para reiniciar cualquier display manager
Poner en la terminal:

sudo systemctl restart display-manager




# Para añadir varios idiomas para elegirlos al entrar en el Display Manager
Bien esto es util al instalar Debian Netinstall CD debido a que allí por defecto sólo se generará un local y no habrá más idiomas disponibles en la instalación ni en el Display Manager, donde yo había instalado lightdm, pero eso uno lo puede configurar después poniendo en la terminal:

```
sudo dpkg-reconfigure locales
```
y a continuación con flecha abajo o arriba busque los idiomas que desea usar:

```
Configuración de paquetes

 ┌────────────────────────┤ Configuración de locales ├────────────────────────┐
 │ Las configuraciones regionales componen un sistema para cambiar entre      │
 │ varios idiomas, y permite a los usuarios utilizar su idioma, país, juego   │
 │ de caracteres, ordenación alfanumérica, etc.                               │
 │                                                                            │
 │ Por favor, elija las configuraciones regionales que desea generar. Se      │
 │ recomiendan las configuraciones regionales UTF-8, especialmente para       │
 │ instalaciones nuevas. Otros juegos de caracteres pueden resultar útiles    │
 │ por compatibilidad con sistemas y software antiguo.                        │
 │                                                                            │
 │ Seleccione las configuraciones regionales que desea generar:               │
 │                                                                            │
 │  [ ] Todas las configuraciones regionales («locales»)                  ↑   │
 │  [ ] aa_DJ.UTF-8 UTF-8                                                 ▮   │
 │  [ ] aa_ER UTF-8                                                       ▒   │
 │  [ ] aa_ER@saaho UTF-8                                                 ▒   │
 │  [ ] aa_ET UTF-8                                                       ▒   │
 │  [ ] af_ZA.UTF-8 UTF-8                                                 ▒   │
 │  [ ] agr_PE UTF-8                                                      ▒   │
 │  [ ] ak_GH UTF-8                                                       ▒   │
 │  [ ] am_ET UTF-8                                                       ▒   │
 │  [ ] an_ES.UTF-8 UTF-8                                                 ▒   │
 │  [ ] anp_IN UTF-8                                                      ↓   │
 │                                                                            │
 │                                                                            │
 │                    <Aceptar>                   <Cancelar>                  │
 │                                                                            │
 └────────────────────────────────────────────────────────────────────────────┘
```

Luego de elegir los programas a instalar con TAB ir a "Aceptar" y dar ENTER, luego elegir un idioma por defecto:

```
 Configuración de paquetes

  ┌───────────────────────┤ Configuración de locales ├───────────────────────┐
  │ Muchos paquetes en Debian utilizan las configuraciones regionales para   │
  │ mostrar el texto en el idioma de los usuarios. Puede elegir la opción    │
  │ predeterminada de entre las configuraciones regionales que ha generado.  │
  │                                                                          │
  │ Esto seleccionará el idioma predeterminado de todo el sistema. Si se     │
  │ trata de un sistema con varios usuarios en el que no todos hablan el     │
  │ idioma elegido, pueden tener problemas.                                  │
  │                                                                          │
  │ Configuración regional predeterminada para el entorno del sistema:       │
  │                                                                          │
  │                               Ninguno                                    │
  │                               C.UTF-8                                    │
  │                               en_US.UTF-8                                │
  │                               es_EC.UTF-8                                │
  │                                                                          │
  │                                                                          │
  │                   <Aceptar>                  <Cancelar>                  │
  │                                                                          │
  └──────────────────────────────────────────────────────────────────────────┘
```

yo reinicié pero no encontré disponible, pero instalé otro Display Manager llamado lxdm y desinstalé lightdm (pero aún desinstalado deja archivos en: /etc/lightdm/) y reinicié y sólo allí apareció el otro idioma que yo había instalado




# Consultas

Debian 11 xfce 416 switch language
https://www.reddit.com/r/xfce/comments/nwjjke/debian_11_xfce_416_switch_language/


