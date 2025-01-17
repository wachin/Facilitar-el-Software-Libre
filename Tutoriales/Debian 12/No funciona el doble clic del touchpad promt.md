# Mi laptop Dell inspiron 1750 en Debian 12 no le funciona el doble clic del touchpad, pero esto si me funcionaba en Debian 11, SOLUCIÓN





El doble clic del touchpad que funcionaba en Debian 11 ahora no funciona en Debian 12 en mi laptop Dell Inspiron 1750, para resolverlo e Instalado synclient:
   ```
   sudo apt install xserver-xorg-input-synaptics
   ```

y he añadido al arranque:

   ```
   synclient TapButton1=1
   synclient ClickFinger1=1
   synclient TapButton2=3
   synclient ClickFinger2=3
   synclient TapButton3=2
   synclient ClickFinger3=2
   ```

y allí funciona

Pregunto si no habrá alguna otra manera de arreglarlo

