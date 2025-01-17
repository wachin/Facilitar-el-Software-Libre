#! /bin/bash



# Cómo crear Script para añadir 75Hz en Monitor Externo en Linux

# Debemos saber cuales son las resoluciones que soporta el monitor, y esto solo se puede saber por el fabricante del mismo

# Para el monitor emachines E202HL

# eMachines E182H, E182HL, E192HQ, E202H, eView 15 User Manual 
# https://manualzz.com/doc/56078540/emachines-e182h--e182hl--e192hq--e202h--eview-15-user-manual

# allí dice:

# Pixel resolution:
# E182H/E192HQ : 1366 × 768 (native)
# E 202H: 1600 × 900 (native)

# De esos datos usaré "1366 × 768 (native)"
# Ahora debemos conocer el nombre maquina del monitor, pongo:

# xrandr

# y me devuelve:

# Screen 0: minimum 320 x 200, current 1600 x 900, maximum 8192 x 8192
# VGA1 connected primary 1600x900+0+0 (normal left inverted right x axis y axis) 443mm x 249mm
#   1600x900      59.95*+
#   1280x800      59.81  
#   1152x864      75.00  
#   1280x720      60.00  
#   1024x768      75.03    70.07    60.00  
#   832x624       74.55  
#   800x600       72.19    75.00    60.32    56.25  
#   640x480       75.00    72.81    66.67    59.94  
#   720x400       70.08

#eso significa que es:

# VGA1

# Ahora ingreso los siguientes datos a la terminal:

# para emachines E202HL

# cvt 1366 768 75

# como resultado aparece así:

   # 1368x768 74.90 Hz (CVT) hsync: 60.30 kHz; pclk: 109.50 MHz
#   Modeline "1368x768_75.00"  109.50  1368 1448 1592 1816  768 771 781 805 -hsync +vsync


# Copio la segunda linea desde el: " y la pongo con xrandr --newmode, así:

# xrandr --newmode "1368x768_75.00"  109.50  1368 1448 1592 1816  768 771 781 805 -hsync +vsync

# y con esos datos pongo así:

# xrandr --addmode VGA-1 1368x768_75.00

# xrandr --output VGA-1 --mode 1368x768_75.00

# Luego de darme cuenta de los valores necesarios para añadir el nuevo modo, esto es lo que pondré en el script:

#---------------------------------------------------------

xrandr --newmode "1368x768_75.00"  109.50  1368 1448 1592 1816  768 771 781 805 -hsync +vsync
xrandr --addmode VGA1 1368x768_75.00
xrandr --output VGA1 --mode 1368x768_75.00

#---------------------------------------------------------

