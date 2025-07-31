
https://github.com/FSKiller/Microsoft-Fonts

y cree un fork

https://github.com/wachin/Microsoft-Fonts




hay un usuario que creó un repositorio en github con muchas fuentes de microsoft, que opinas del contenido de estas y pregunto cómo las puedo instalar en linux

### Desde Github

```bash
mkdir -p ~/.fonts
git clone https://github.com/FSKiller/Microsoft-Fonts.git
rm -rf Microsoft-Fonts/.git      # Eliminamos el historial de Git
cp -r Microsoft-Fonts/* ~/.fonts/
fc-cache -fv
```




