# Dolphin Administrador de Archivos en Debian 12 de 32 bit (Ejm MX Linux 23, etc) no monta / tiene acceso/ puede acceder / al teléfono / Dispositivo Android por cable USB

https://facilitarelsoftwarelibre.blogspot.com/2024/07/dolphin-administrador-de-archivos-no-monta-el-telefono-android-en-debian-12-de-32-bit.html

A esta fecha 22 de Julio de 2024 he instalado [Debian 12 NetInstall CD ](https://www.debian.org/CD/netinst/) de 32 bit y dentro he instalado el administrador de archivos Dolphin según[ mi tutorial](https://facilitarelsoftwarelibre.blogspot.com/2019/11/instalar-correctamente-dolphin-en-entornos-no-kde.html) y tengo un celular [Redmi Note 11](https://www.mi.com/global/product/redmi-note-11/) y al conectarlo al ordenador no se monta, aparece así:

![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjmbmfUO_5wefkiWEbLzvbmICEWbLQuNWVnourNhyphenhyphenzPgh2oP-IEOhDviRn-NCSYjIhPfNKm8_pJIT0Bg3p61HZ2MJMIf-m17Te_c2_wlTzcLLDYzeunPTky55Dnu6py4T9ciKyt80R8bQDg9IbBiJEupjs9D5Ir_ghZF8dNax6mYcsZwM87eJjkF-7HL8U/s16000-rw/20240722-111314%20Dolphin%20o%20tiene%20acceso%20al%20USB.png)



esta es la solución para este caso y otros Sistemas Operativos debian 12 de 32 bit en que quieran usar Dolphin y no puedan acceder al Celular por medio del Cable USB  

**Nota**: Puede que luego envíen una actualización con la corrección y este tutorial ya no sea necesario.

La solución la encontré buscando en inglés y me encontré esta entrada:

**KDE not mounting Android Phone**<https://forums.raspberrypi.com/viewtopic.php?t=359400>

y allí dice que hay un archivo que apunta mal, en una terminal ponga para abrir el archivo:

kate /usr/share/dbus-1/services/org.kde.kmtpd5.service



a continuación le indico cual es el error:



[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgzKZChxVvaSUJhyoixznb7SEjTKrXYo88Ewh7eHEmDNSV5H2Y0KFEy03UrreAj-U8SsK_Re8SvjVehc6NwzEAPx0Od4F_UK4pmhFzhejzUCxrXS_Iy3LLZcclJowYRkmP3zTvcCvpQ-pFgVZuLEsQLQv0NGw4ZrEa_OiOoL2l92ht8EsKdWQM0ExbqxP4/s16000-rw/20240722-122349%20explicaci%C3%B3n%20del%20error%20en%20org.kde-kmtpd5.service.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgzKZChxVvaSUJhyoixznb7SEjTKrXYo88Ewh7eHEmDNSV5H2Y0KFEy03UrreAj-U8SsK_Re8SvjVehc6NwzEAPx0Od4F_UK4pmhFzhejzUCxrXS_Iy3LLZcclJowYRkmP3zTvcCvpQ-pFgVZuLEsQLQv0NGw4ZrEa_OiOoL2l92ht8EsKdWQM0ExbqxP4/s903/20240722-122349 explicación del error en org.kde-kmtpd5.service.png)





como le indico, en Debian 12 está mal, esa ruta:

/usr/lib/x86_64-linux-gnu/libexec/kf5/kiod5

pues no existe en el sistema operativo de 32 bit

la ruta correcta es:



/usr/lib/i386-linux-gnu/libexec/kf5/kiod5

que lleva al archivo:

kiod5



[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjldyO4SgS8Q2IgsBLwwX97aBbRpSXDqxRcJvL8Y29bdY98jib4UqYQMTKJ4cFBryhvWPr4tyuGKfrJQshjeHgR8SMY203Ckus0JRTKxMfQ_K7U9oqEtzP3Ew_ctTkyEErxID6OaVcxNI80FMDbMynm-xJMVpqgZzuGjZu9VxSQ80wDuZL3pHfxbPeuWpA/s16000-rw/20240707-004743%20ruta%20correcta%20al%20archvio%20kiod5%20en%20Debian%2012%2032%20bit.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjldyO4SgS8Q2IgsBLwwX97aBbRpSXDqxRcJvL8Y29bdY98jib4UqYQMTKJ4cFBryhvWPr4tyuGKfrJQshjeHgR8SMY203Ckus0JRTKxMfQ_K7U9oqEtzP3Ew_ctTkyEErxID6OaVcxNI80FMDbMynm-xJMVpqgZzuGjZu9VxSQ80wDuZL3pHfxbPeuWpA/s679/20240707-004743 ruta correcta al archvio kiod5 en Debian 12 32 bit.png)

entonces debemos de corregir eso, usemos nano, desde la terminal, poner:

```
sudo nano /usr/share/dbus-1/services/org.kde.kmtpd5.service
```



le preguntará:



[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhGliJglr1s33rTPzAiIO8IFvNonXLxTKS13upXosk8sQqLZjvX0fJkvzBo91xNZqcxIzl_ZoLslvzqf4t3jtdsef8-lgo-MoEe3Yl54YEeeeRbnNuhywNmZtroj1Uo4DanyQ4ZATz8NdiK6Jdw11-IyvKVKaStWUDRl2neouYZost46viiCFFX78WySvI/s16000-rw/20240707-005811%20le%20preguntar%C3%A1%20y%20escriba%20s.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhGliJglr1s33rTPzAiIO8IFvNonXLxTKS13upXosk8sQqLZjvX0fJkvzBo91xNZqcxIzl_ZoLslvzqf4t3jtdsef8-lgo-MoEe3Yl54YEeeeRbnNuhywNmZtroj1Uo4DanyQ4ZATz8NdiK6Jdw11-IyvKVKaStWUDRl2neouYZost46viiCFFX78WySvI/s901/20240707-005811 le preguntará y escriba s.png)

y escriba:



s



y aparece así:



[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMz-f8HBUTRd7xeqv9JRtBKJkSCspVj68gruvoi9KQlZWExHGcbtv16Y7eLLNH9GGmAvlLtEIDqlaPEepPIJXz8t-kCu5mSaUQkqPJa7I5GsR66DwYMw5ssrPMVBWrb-GF8imL1XGrn3LOvvjg8qVGQd0OnGluPcpqwvQyatLPPlh21WwbLYvNFS5HX0U/s16000-rw/20240707-010007%20queda%20as%C3%AD.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMz-f8HBUTRd7xeqv9JRtBKJkSCspVj68gruvoi9KQlZWExHGcbtv16Y7eLLNH9GGmAvlLtEIDqlaPEepPIJXz8t-kCu5mSaUQkqPJa7I5GsR66DwYMw5ssrPMVBWrb-GF8imL1XGrn3LOvvjg8qVGQd0OnGluPcpqwvQyatLPPlh21WwbLYvNFS5HX0U/s902/20240707-010007 queda así.png)

con las flechas del teclado ubíquese a la derecha del texto:



kiod5



y con la tecla "Retroceso" o "BackSpace" borre toda esa línea hacia la izquierda, debe quedar así:



![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiQVKreZyIj106KRBG4TsM3vC5R2WLJoYkMJlbaVLMXk6I1XO0yehnl2wfsrGB7jXDPqTnGv__dwpdGXqlx2LGNMcXoE5sSfXgyn7_e4KDEmMzOtuRB7waDYpd49FWl2MDu_Vw1kfUlIls2dOSurFuwqlpmYQOF820G7KD21D0ZEifKaWTEAAVahSpaZaE/s16000-rw/20240722-123020%20he%20borrado%20la%20linea%20errada.png)

y copie la línea:



i386-linux-gnu/libexec/kf5/kiod5

y peguela allí con clic derecho, debe de quedar así:

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUvRJTWiMl2avec_7nQrC91AkVcMA1q-KroU9lj9uIRotsgUbLD-hkbbasfpAebDGILMJV0pQfTTVkttM-5TjDFIPJJCSdlu1zSEJ5MRPQyaZCfSHMCNZIJ9sJEIDNlwiVZKfev_Mhwrqey0-lnablWO-n_-AjWLjtdC_dBNhkUbhvD7eLQ_4aM5pX-ak/s16000-rw/20240707-010330%20ruta%20corregida.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjUvRJTWiMl2avec_7nQrC91AkVcMA1q-KroU9lj9uIRotsgUbLD-hkbbasfpAebDGILMJV0pQfTTVkttM-5TjDFIPJJCSdlu1zSEJ5MRPQyaZCfSHMCNZIJ9sJEIDNlwiVZKfev_Mhwrqey0-lnablWO-n_-AjWLjtdC_dBNhkUbhvD7eLQ_4aM5pX-ak/s898/20240707-010330 ruta corregida.png)

**GUARDAR CAMBIOS**.- Nano abrevia CTRL con ^, así CTRL + O es igual a:

^O

y en nano aparece así:

^O Guardar

para indicar que es el comando para escribir.

**Nota:** Es importante hacer notar que es la letra "o", no es "cero" o sea "0"

Para guardar aplaste:

CTRL + O

y le aparece un mensaje que dice:

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEihi1Mwy-hxQrEslUX-JkhsOhJdlVMMKyH8W5zSYHCT-t5JuZFhdduIesHywFlUo96hzsYzeLTgBjQ7mSlyXyKIjTyJEZnUjMvZezeqJ3Y30HXpUbtpOv-rTvbwAP26OzTe0P0yx0PcN9fUhXJKBBuePJAw7U8N2-gDxFPE3RI_O8XwMPd0iV-2Q5EW68k/s16000-rw/20240707-150134%20de%20Enter%20a%20los%20cambios%20para%20que%20se%20apliquen.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEihi1Mwy-hxQrEslUX-JkhsOhJdlVMMKyH8W5zSYHCT-t5JuZFhdduIesHywFlUo96hzsYzeLTgBjQ7mSlyXyKIjTyJEZnUjMvZezeqJ3Y30HXpUbtpOv-rTvbwAP26OzTe0P0yx0PcN9fUhXJKBBuePJAw7U8N2-gDxFPE3RI_O8XwMPd0iV-2Q5EW68k/s795/20240707-150134 de Enter a los cambios para que se apliquen.png)

de Enter:

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgHK5faXNiaE3dDswNvCJHV9yDyaeUlHHagr4lTLsBC6Yd00BajAGUeaI0akWfDPgd7S9LnvmGrz-PeN-o61BPBTkq7USBon9lIfXsfl7mrhdsHzitYS7ov5iiPaTgi_VWC_TXQmZbCDKXOlG-YkxJbzJoeGnVNHDa9rVC-2b8wSm6yLm0u-SKgyAlrM8U/s16000-rw/20240707-010617%20de%20Enter%20para%20escribr%20en%20el%20archvio.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgHK5faXNiaE3dDswNvCJHV9yDyaeUlHHagr4lTLsBC6Yd00BajAGUeaI0akWfDPgd7S9LnvmGrz-PeN-o61BPBTkq7USBon9lIfXsfl7mrhdsHzitYS7ov5iiPaTgi_VWC_TXQmZbCDKXOlG-YkxJbzJoeGnVNHDa9rVC-2b8wSm6yLm0u-SKgyAlrM8U/s907/20240707-010617 de Enter para escribr en el archvio.png)

para escribir en el archivo:

org.kde.kmtpd5.service

**Cómo salir de nano.-** Aplaste CTRL + X (Nota: Si Ud está escribiendo algo y ha aplastado CTRL + O la opción CTRL + X no estará disponible hasta que Ud de ENTER)

y ya está. Reinicie el Sistema Operativo

y al entrar ahora si puedo acceder desde Dolphin a mi celular Android Redmi Note 11:

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjS8ZmYjtLG1HxDPqPfwLQWEIauFuoE2-eSwzdX8yvTqQdGB4n2Ca8II-rQzJSe7tLzXO-NRr1uf1-hzVVVFinJm2Tcpp4507M82xT9fCH3R_ypgpshFjgiyn3NdLEJ4awTb3s9pV2ZF_JGDJq3vQnDNnwe_hVxO7YRjpIVZ-SNuyGer2HrQhTWHP-iD4g/s16000-rw/20240707-150826%20ahora%20si%20puedo%20acceder%20desde%20Dolphin%20a%20mi%20celular%20Android%20Redmi%20Note%2011.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjS8ZmYjtLG1HxDPqPfwLQWEIauFuoE2-eSwzdX8yvTqQdGB4n2Ca8II-rQzJSe7tLzXO-NRr1uf1-hzVVVFinJm2Tcpp4507M82xT9fCH3R_ypgpshFjgiyn3NdLEJ4awTb3s9pV2ZF_JGDJq3vQnDNnwe_hVxO7YRjpIVZ-SNuyGer2HrQhTWHP-iD4g/s798/20240707-150826 ahora si puedo acceder desde Dolphin a mi celular Android Redmi Note 11.png)

Dios les bendiga