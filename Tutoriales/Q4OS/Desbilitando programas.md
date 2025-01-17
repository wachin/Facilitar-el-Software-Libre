


Como instalé RisenPC Fluxbox e instalé network-manager pues para cuando quiera usar el escritorio Trinity he desactivado el autostart:

sudo kate /etc/xdg/autostart/nm-applet.desktop 

la siguiente secc sección estaba así:

Icon=nm-device-wireless
Exec=nm-applet

y quedó así:

#Icon=nm-device-wireless
#Exec=nm-applet
