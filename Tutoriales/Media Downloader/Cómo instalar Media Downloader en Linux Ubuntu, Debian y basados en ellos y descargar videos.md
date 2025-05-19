### Instalar "Media Downloader" y "yt-dlp" para descarga audios (en mp3) y videos (mp4) de youtube con en MX Linux, Ubuntu, Linux Mint, otros

Media Downloader es una interfaz gráfica que usa yt-dlp (es un programa de línea de comandos) para descargar videos, audios, desde Youtube, Facebook, Instagram, Tiktok, Twitter, y diferentes sitios. Con este tutorial tendrás la información necesaria para instalar:

- Media Downloader

- yt-dlp

### Instalando la ultima versión de yt-dlp en Ubuntu

Instálelo desde el:

```bash
sudo add-apt-repository ppa:tomtomtom/yt-dlp
sudo apt update
sudo apt install yt-dlp
```

con esto lo tendrá instalado, si desea puede revisar los paquetes en:

 [https://launchpad.net/~tomtomtom/+archive/ubuntu/yt-dlp](https://launchpad.net/~tomtomtom/+archive/ubuntu/yt-dlp)
 
![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEir4cBWGJVA8d-ax6rhs2r8FchbwE9Z05C7ovQkEuItrMsmkkSIYZ07GXrSmuyMOduw-Y356RB2G4uVzqn1KOgsOoKVUjGxKSuaIqZknGdtcS_FT3cz5yy2AFmXXUSura1idbnQZ3Vc5_0TYd0Ci1tJPMdFeHGEXcmCDk2QZiX10CV8RUUVSR4xCBsVe98/s16000/20250518-0003%20reviar%20los%20paquetes%20deb%20de%20PPA%20yt-dlp.png)

**Revisando el deb por seguridad.-** Navega hasta encontrar el archivo deb de su versión de Ubuntu, y descargarlo, y desde un Navegador Web entre en [www.virustotal.com](http://www.virustotal.com) e inicie sesión y si no tiene una cree una, y suba el archivo.

### Instalando yt-dlp en MX Linux, antiX o basados en Debian con este repositorio instalado

A la fecha Mayo 2025 hay en los repositoros de MX Linux 23 (base Debian 12) una versión actualizada de este mismo año, instalarla así:

```bash
sudo apt install yt-dlp
```

para los que usen algún Sistema Operativo Debian pueden instalar el Repositorio de MX así:

**Instalar el repositorio de MX Linux en Debian 12, 11, 10 y Sistemas Operativos Linux basados en el**
[https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html)

lean esa entrada, allí hay explicaciones de que yt-dlp puede estar en los repositorios de prueba y luego pasar a los estables (ahí se la podrá encontrar en Synaptic), incluso se puede encontrar una versión actualizada en Backports de Debian, todo es depende de dónde esté disponible la última versión la podrán instalar.

**Nota:** En caso de que alguien sólo quiera usar yt-dlp desde la terminal vea [este tutorial](https://facilitarelsoftwarelibre.blogspot.com/2025/04/como-instalar-yt-dlp-en-termux-para-descargar-vieos-audios-de-youtube-y-otros-sitios.html). (pues también se puede descargar videos, audios sólo usando la terminal)

### Instalando Media Downloader

Media Downloader está disponible para varias Distribuciones Linux, en el siguiente enlace del Software de OpenSUSE:

[https://software.opensuse.org//download.html?project=home%3Aobs_mhogomchungu&package=media-downloader](https://software.opensuse.org//download.html?project=home%3Aobs_mhogomchungu&package=media-downloader)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEglQs-4vRP3vFSWofyJJOO2TCZWro_8pZYpQtUK8r3PJhFFOKatmVlMBg6tTD6RzIwVXOJ3bk8M1ituawixH4v8avpFYAZhFHtPKZYLbwGzJO1A3fwB321YzBmn23b7IAwZSEkHIHlT72OSMAD3Y3Fxnq_HgNWH53rUjNxihU_B4y0f5Ri8HmWpr64rGnE/s16000-rw/20240205-053912%20media%20downloader%20para%20otras%20distribuciones.png)

se ve en la lista: Debian, Fedora. openSUSE, Raspbian

Este tutorial lo he probado en:

- MX Linux 21 (basado en Debian 11)
- MX Linux 23 (basado en Debian 12)
- Debian 12 versión LXQt

## Instalar a Media Downloader desde Software OpenSuse

Buscar según sea su distribución, sigan las instrucciones e instalarlo, ejemplo lo voy a instalar en Debian 12:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8rJ1kts03MNVO17SKCa7OEBrjd2Sqa8fgn-c4Yz4-6N4YLXS9tMCDeVqDYlnP8JCy-G2ilRIKZPmVJyZ99WiEtBnxVFE9CLE19Xt3LVtGoxt6XBkmE1x96SOOaWvlb3uJYWznxwqCvUTJKe8HeH7eVi-CNiiCYaHSznLUdZ_lx94HOAJ0f-yuPKBJ1_Q/s16000-rw/20250404-102020%20lo%20mejor%20es%20instalar%20el%20repositorio%20de%20Media%20Downloader.png)

Ahora hay que abrir a Media Downloader, búsquenlo con el siguiente nombre:

`media downloader`

o

`Descargador de medios`

y entre sus aplicaciones ábralo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg_pEIFgCkpHL-8peMKnWahKbsvW7wnRS2Px2vA-2HD3hYvso7kEFFeUgrDC1XAZ0-DCky-9X7RBDKS910IqQkIC_wDfJ8UOhMKeYkr5hdca9O4sGcI_Mgb1UoShz9kNpl4E5kb3t2tBzfQPPp-su6ntM1s8XHObocYQhf95zNutsnVtNQUKIfz3C6ml2Y/s16000-rw/20240121-164448%20media-downloader%20instalado.png)
**Nota**: La imagen de arriba es de xfe4-appfinder en MX Linux 21 donde instalé el administrador ventanas Fluxbox.

Cuando se abra el programa, éste chequeará los otros programas que necesita, en la imagen de abajo ven que tengo instalado aria2 pero ese es opcional, pues se supone que uno lo puede usar en vez de yt-dlp para descargar cosas, en la parte de abajo de el tutorial les he puesto unas explicaciones de cómo instalarlo:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEifwDN0cr2smvEtcDzwhMQtiQFq0WmmJ1xA2DinEdb6koEA7yP3OGujYE8Tv1i70oDHMsYB4DeasuJzq03cpIX-upyR_uPs7nLwSeSLTcKTPrqc-OxyD5_qn7ttnSL66bBuCl2eZVO9wlnh9Pvcjy2BITS695WYemPLVUO7Ortsus0qldMi29f2BC4NQoI/s16000-rw/20240121-165516%20Media%20Downloader%20chequeando%20sus%20dependencias.png)

**Nota:** `Media Downloader` siempre al iniciar verificará, y por defecto en "**Engine Name**" estará el que necesitamos "**yt-dlp**" (y según he leído se supone que se puede usar otro motor (engine) como aria2, pero no lo uso).

### Cómo descargar un video de youtube?

Peguenlen un enlace de algún video de Youtube y clic en Descargar:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1vpnmARObipDbk9eDf7zUrrzId0L2mqtZf2gSF0ClHkX2rEf6iQUYR0iFzBgeTCUzLNdWFBo5-tQIrRstkXE2yy5oAa3i0jpbTEh8Y_oTU-E-cxCSNbCJyrCyt35ous9o8bAJbMtoIVNMg7PanogFmFaH85cKhmoLkiTM2vrCzqNy9M5zhVpnMVmfVRM/s16000-rw/20240121-170006%20peguenlen%20un%20enlace%20desde%20youtube.png)

se descargará el video por defecto en HOME (pero pueden dar clic en la carpeta y buscar otro lugar donde descargar)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1SJoSPh722-Pgx3JtseRDY7-ncSwoiANnPNrphxfQBaAmWt83IuXVFNWmCxg4-X7_9N9h5ryfE_euVtvt13TttQyMw_aiDlMkJ41aqBtlDvqSJIKuoo6OE1Nt2NcCBGLveEEk-DDtLvRwglW_kmMmA7fxF8Xem-ri870ob2q88zun4L5d0R0A6JoBX9w/s16000-rw/20240121-170215%20por%20defecto%20descarga%20los%20archivos%20en%20HOME.png)

También, al programa se lo puede poner en español allí, en:

-> Configurar > Seleccionar Idioma

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiidCLi25_aLNi5pawTV0O7dq_OPuyq1dvi6VCBEgIH385tgpYLj5zujkXBtqWqBCnEm55oWV1zzvlayIblk848VBJ-8CXlVyuLaGZkUw2ONLVmwflopKgmHedNP-W1_Wsidg251Wg-MOixMaEYPuiUKIUlp_0neTg9q__xS_RcU8ShjoIMg9uU4Z6weXs/s16000-rw/20240204-204110%20a%20media%20downloader%20se%20lo%20puede%20poner%20en%20espa%C3%B1ol.png)

En la imagen de abajo se ve un vídeo descargado en HOME que es la ruta por defecto:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEibXDZ8owN_dWP1loIOIZ3GuRN-dEG78ktcUadzkS76SK_HQmsSBnSF3fFF-cJ-T6K1P0pu2XAd5xhq8uuYhmzCzQPsOSBJZ9_7PB-QZVtZDMev4UJU_k0yyhloX9A8UvMp68ermVgeEGp2a9eNjhqqOMguoWLSDeVpjCXj-0_ZNIhuXxaktadJ-Ee7ntY/s16000-rw/20240121-170404%20el%20video%20se%20descargar%C3%A1%20en%20HOME.png)

**Nota:** Puede usted ver en la imagen de arriba que el archivo termina en:

**.webm**

eso es porque ese video estaba disponible para descargarse así, otros videos de podrán descargar con otra extensión, pero si usted desea que siempre los videos que descargue el programa estén en mp4:

## Descargar otras resoluciones de Video siempre en mp4

Lo siguiente quiero poder explicarles de la mejor manera, sucede que hay videos que han sido subidos a Youtube con diferentes resoluciones, eso depende de la persona que los subió (del equipo que tenía), ejemplo, imaginensen que yo subí un video desde mi filmadora en la resolución 720p, éste, desde Youtube se podrá descargar en esa resolución y en Media Downloader también a esa resolución, además de en las resoluciones más bajas a esa, es decir:

144p
240p
360p
480p

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhnphgqNyRG4ATZy54kahnCiWrapF8jmIIX2gRjJNlwWZTG6cBV2_Judh0NmSQcfiX6__IDZCGYI8S3J5RlcHPgpqKRkQhEK-ogXiY7gBOXmBZGNJePsEhhHBUVj99azjc_cF3myMk9OADD6cLkixtUUFNAWzDIc7g7634EWA7hewrx0QlOZa7QtbDN1qI/s16000-rw/20240121-173010%20varias%20opciones%20de%20video%20720p%20ejemplo%20de%20un%20video%20mio.png)

las resoluciones más altas yo no las habría subido, así que no tiene sentido usarlas, epsero me comprendan lo que quiero decir. Así ,que esto hay que tenerlo en cuenta, y eso se puede ver en Youtube en:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj5n96mRxvfoKAb0wi1zu0FS5kM7OK7tvbyaJl_chQVMuC_jI0jKCTNlkN2Ueo97Nukh7s_dnAK_JS2ll8ECtIHKtYVHfFkQ-Ek9ktdzLstdqzQE8moOP_zJ95UntsyzugW0uO_VEchHH-Qc4FTF8rhv1wm28AkOVXL5hYizMOkyW4MZJnNm_WHoHLfJhE/s16000-rw/20240121-173537%20youtube%20calidad%20de%20los%20videos.png)

**Nota:** La captura de pantalla de la imagen de arriba es del 21 de enero de 2024, esto explico porque las configuraciones cambian con el paso del tiempo.

Les explico mas a fondo con flechas en la siguiente imagen:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhfsLJhfY8tTJN4mUTd-LGKgsh2Smo0jSl7tsinkBWuwdd1yQnwt41UVxKHPleZw8XxBiJxmTNN21dtPouOJtRub28O3s5uxtYZ3N75E36ci9CmuokqXi7VgCBPYWxCvirRE92mP1bd8IUpQodyiAL_bI75KtjsNGdLvYBjJZkT2qp244FcrFh452egNCM/s16000-rw/20240121-173804%20tres%20opciones%20de%20calidad%20de%20descarga%20en%20un%20video.png)

como ven en la imagen de arriba, del video:

**Ultimo Live de Jaime Murrell (Un llamado a la Reconciliación) ENERO 2021**
[https://www.youtube.com/watch?v=Uahg2piJ7y0](https://www.youtube.com/watch?v=Uahg2piJ7y0)

tiene disponible tres calidades o resoluciones:

360p
240p
114p

cualquiera de ellas se las puede elegir en Media Downloader:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjLaHll0lZS-XIyxb4gs_qrTe2sNywWWd9n40D0TBDvyHm_3d4DTse5Cb4wz8zxT6-b4RhHh2RNYoKCoP5hyphenhyphen_TbUDxhreGBB2Ufhs1NpXfQfciW2egSoGuBacjJ-b5eVhosvC5NNVgc3hkgI6r9yc6gtCBW8oRdqdOLnmztQEVqjoMAln7GeOwG4WdolNA/s16000-rw/20240205-085852%20ejemplo%20de%20descarga%20en%20Media%20Downloader.png)

pero no tiene sentido usar las más altas. Cuando le de clic empezará la descarga.

## Descarga por lotes

Uno puede añadir varios enlaces de videos, ejemplo:

**Cristo Reina**
[https://youtu.be/E5Nsi0Cf7uE?si=eGP-rdXkC1swbEbC](https://youtu.be/E5Nsi0Cf7uE?si=eGP-rdXkC1swbEbC)

etc

se las podemos añadir al programa una por una en la pestaña:

**Descarga por lotes**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8wdCp9vUAKRrGDVXHG0BnhqlogYBNy9cjBExLve2fa6iKQNRVbnrNzd-fEbTiRSVf4gZ06trqyd_xvF06NurcvJB-lLf3OAZnIiFjstNhGAUUGSHdWQiConH4SBIY1gFN6lIzFoeALItBHvV2AjebVZu9uD7y0bidrvMBkHnuzB686XN2rS10JGPaOE8/s16000-rw/20240205-094443%20Descarga%20por%20lotes%20de%20Downloader%20Media.png)

debemos de añadir la url:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4KfGb4qYkxx4qLuiQCZ6Zr8uaRusgknUG8fFpB0ssbX9lMzWDw5laC1SGrq7amzFCFlDbtaTSTdKjbz19z9CnRdqW3CcuEvIhyiA6VNhcukFj4SieDbH2Q4wfF-Q2QicvZhYgr8rYQaZrnEbavkG59ksWBMqemYgI4A2_ueX_ng79trftXTyNaE9-I7k/s16000-rw/20240205-094648%20a%C3%B1adiendo%20un%20enlace%20de%20youtube%20a%20la%20descarga%20por%20lotes.png)

**Nota:** Podemos añadir la opción de descarga que necesitemos, sino dejar en Default

En la siguiente imagen ya he añadido las tres url:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhtWwoyIx8vqC9MdO-h-49uckcbbYvYd8gEc0LyNB4pc3NsRbgRk_SZxbB-ehbZV7FATwiXDVtOCYslDh8OOscWPp3Bpah8X0DJ-RM_tyE4rfCYeTYELpdaVKVjHZ0QOJJgCoquDJI983VSstGxpqVScdkFVpuNnClTUkXrfX_eqpK0CQnukesIhaNnfIQ/s16000-rw/20240205-095031%20clic%20en%20Descargar.png)


## Cómo descargar audios mp3 con Media Downloader

Si usted ya tenía puesto un enlace, dar clic en:

**Options - Best-audio**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi9d7EjHDao9XLdfnwEwOS6TznMj9l8dQt0m82q0IKQJUeaXNxtODQC4Ccs37SMVlBANXObXLgLDL3C8HBV3xi5wThMRQghxQvb9zDokGi52S1OkZ2rBOsKuxolIl5zW6KJVTUsxND-9NzobypiaAHi-KUn7Ydzp-pMxeqW9CIocBeFCM4RBleC5ZPXJBY/s16000-rw/20240121-170554%20Media%20Download%20opci%C3%B3n%20y%20Best%20Audio.png)

y se descargará automaticamente el audio:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjkmohzoNGROP5yDQ9fqUGafxtVHS6ky_iTaq8h5YtPV61sMM2RzMIEmU2C9YKwBH5_bcJW2h2anVWREpgLCWzlqX8zU2ShNTANcJXt0SDxmfd5VCPiV0oBydLb3oz0lJV4HYSESY-xnDTX48IzdSpiZDo41YzAEgIkBIyGcusT4m8SO9Zwv-7pci83krc/s16000-rw/20240121-171444%20Media%20Downloader%20audio%20descargado.png)

y como ustedes ven en la imagen de arriba el video que antes estaba ha desaparecido y ahora está como mp3, o sea el programa borró automáticamente el archivo anterior y lo reemplazó por el mp3

## Cuando ustedes abran por primera vez el programa y quieran descargar desde youtube un mp3

el programa Media Downloader estará en:

**Enter - Options**

por defecto en:

**Default**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhjh1Luv3zNN9YB3FossC8AenPknv2drhZNWNgXajxPx5E0YkHdcb-OPzOud-L20HJgEPMvz9dxauMrRgOaSopJ5LGoHEwmA-6OY2Fbruul9YIAThX7l7DBS5RLgb9w_Y3RDiKAUPSJOCbjqIlFTsqhn0NrBOLwg4WP907Obduq1pkzt6Oq3WmZLsNT-OE/s16000-rw/20240121-171801%20Opciones%20por%20defecto%20en%20Media%20Downloader.png)

de clic así mismo en:

**Options - Best-audio**

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi4_HSLZY2SAQaJmIPSj10DXBA5L7JougU0jwaZeGrqyklNZu-r5VR3IBHCyTGW7iNzkyrjPwg6BJfvBSKP0pj8eD15MFheQ5BYoJm6JWDwdcWjJ0witD8rmVF1OxWCqjpivOuPKrLyQcoe93doTv5xEoMQcCHp6eGLcsHh8qv44ATcVpYxTjTRwQkQomg/s16000-rw/20240121-172100%20Media%20Downloader%20poner%20Best-audio.png)

y peque algún enlace de youtube:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgaX1xxafsoVeiZN7ktP9_AT-CB99qmHkSf91WUJanUK8D5Sz2jlWLQIrVsR-OwHPCZ2Kh83QUWRWmzv4QUavq2mFmxcuI9V91LKNVOvOqYbOJ4_vITrQItTTRUVy7XZBvwMiIY-CowMIpW1_4sLwZmKlK2jIxnXJQA9JKzPSHg45gI2YMHdWIkKKP1ki0/s16000-rw/20240121-172318%20poniendo%20un%20enlace%20y%20clic%20en%20Download.png)

y clic en Descargar

**Download**

Para volverlo a dejar como estaba en Options le dan clic en **Enter Options** en:

**Default**

y el programa descargará los videos otra vez


## Cómo usar aria2 para descargar archivos

Aria2 se puede descargar archivos, y para poderlo usar debemos configurarlo, dar clic en:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhm0pPEyfROBaePuC87pvvkEhTXltGB4HtRFasQRJ4pwCKXUKjwky0NNUIj4hLAN0Xmqb8FBSHgAmgDk7dPP-JDdHK19O948ughLOk9XS6F1oL47OZ0UB_TsDtEZ_lyC-Mf1L_YUPSF8xgLQL9Ky-BHKY9z5mEjPYPAhN28QBbUqNqLnZ79StWs3LAGato/s16000-rw/20240205-095925%20eligiendo%20aria2c.png)

y debemos pegar la url del archivo, ejemplo voy a descargar una ISO desde:

[https://sourceforge.net/projects/mx-linux/files/Final/Xfce/](https://sourceforge.net/projects/mx-linux/files/Final/Xfce/)

allí hay la siguiente iso

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjcg5JT1FyzNcsXFyjAdG_qOYhZW3xIVJLgzEQxYAqAdapcIHiCkqcLNcK0-pGgDBxSKDcOt1RvbcnQXo8WuiRSRONpxylBRbeNNlaXZJ724suTtnz-HWC-TtuKP3hS0lRS4n7vy7TvXNgvnhyphenhyphen1yuQIGbRtPyymi6sB77tUlrkz9jXpXLTOd6HLEoWeuE0/s16000-rw/20240205-095533%20copiando%20el%20enlace%20de%20una%20ISO.png)

 el enlace que copié es este:

[https://sourceforge.net/projects/mx-linux/files/Final/Xfce/MX-23.2\_386.iso/download](https://sourceforge.net/projects/mx-linux/files/Final/Xfce/MX-23.2_386.iso/download)

el cual lo pegué:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgQPN8-urWc5Oy237jQuViIi6WMsQJHKTMvAorloA4OFSoYLWlnZTxjrMlhAoszadIpd_YBlaBmQ4gdowdmnyQGXwR6hMHLT_k41pJzqAasypPiPx3-C_Tsz56D6LqTYLnIH1CudphhFYkcl-ogBCLh7VTceCLeR_rFYRsLIC0IgFTWGJF_wOa_AY_XmpM/s16000-rw/20240205-100144%20clic%20en%20descargar%20para%20descargar%20una%20iso%20con%20aria2.png)

y ya descargado la iso

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEib0eZks2Wqo48vwe_mA5a_9HxnU844ParwZ7EKo9FPKrjGQ0bNXIoJZhe1XNbs19-FXDhTpHuz2PaIlnsUJNsvknWpY4P3TTPDVaUSWU2YN3PdRcnrc61mRyJxzXbNk7cLf1u-u0BeC3syRX-0Ujm0CQl1CKwUBJlM7DuB2ExLgUyxj0_NTua21LYAIy8/s16000-rw/20240205-095812%20iso%20descargada%20con%20aria2.png)

descargada:

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjdX6ZFvM3yoo2S4My5YqKWgtRVqkgdw-kdMQSrm_Skzvx6Aj_NQnAiiLJ901aD2xgQb-jPhyphenhyphen7eU7j1BNy1sfT9g0G-rCqyG-J2mPQRh-UXPZ3cG4JGeuV2BSAZvj7gF1Yr0eNBegavH_Vtg9yNNsrgpbMgqL9aik49q-bzQq5XBefIZZS6qe417GG1LUY/s16000-rw/20240205-100532%20MX%20Linux%20iso%20descargada.png)

**Nota:** No se olvide de dejar como estaba la opción si luego va a utilizar el programa por defecto

## Descargando lista de reproducción

El programa tiene la opción, pero no me ha funcionado

## Cómo actualizar a yt-dlp

Con el paso del tiempo Youtube hace algún cambio y es posible que no llegue a funcionar Media Downloader puesto que este solo es una interfaz grafica para yt-dlp, por esta razón con el paso de varios meses deben buscar otra vez dónde esté la versión más actual, puede que esté en los repositorios de prueba o en Backports de Debian o luego puede que lo pasen a los repositorios estables de MX Linux y lo puedan encontrar en Synaptic o también instalarlo desde la terminal.

### Instalar aria2 (opcional)

si desean lo pueden instalar, a la fecha 28 de abril de 2025 la ultima versión ya está en los repositorios estables:

aria2

 la pueden instalar desde synaptic o con:

```bash
sudo apt install aria2
```

 **Nota:** Yo no lo uso, pero se supone que se puede hacer que Meida Downloader lo use en vez de yt-dlp para descargar cosas. Abría que configurarlo pero no lo he hecho, [revisar](https://github.com/mhogomchungu/media-downloader/wiki/Extensions).

## Extensiones para Media Downloader

El programa tiene la capacidad de poder usar otros motores así como lo puede hacer con aria2, eso está explicado en:

[https://github.com/mhogomchungu/media-downloader/wiki/Extensions](https://github.com/mhogomchungu/media-downloader/wiki/Extensions)

todavía yo no he instalado alguno de allí

## F.A.Q

Las preguntas frecuentes están en inglés:

[https://github.com/mhogomchungu/media-downloader/wiki/Frequently-Asked-Questions](https://github.com/mhogomchungu/media-downloader/wiki/Frequently-Asked-Questions)

El código fuente de Media Downloader está en continuo desarrollo en [github](https://github.com/mhogomchungu/media-downloader) y lo veo disponible para Windows también. Y el de yt-dlp [aquí](https://github.com/yt-dlp/yt-dlp) y dice que también se puede instalar en Android con [Termux](https://github.com/yt-dlp/yt-dlp/wiki/Installation#android).

Dios les bendiga

### CONSULTAS

**MEDIA-DOWNLOADER**

[https://github.com/mhogomchungu/media-downloader?tab=readme-ov-file](https://github.com/mhogomchungu/media-downloader?tab=readme-ov-file)

![](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirGtKVjGolZesg4GAdDBQMj_6S5WooXhK-U5cZvWoFlBaw8mwIbe_ic6_qMtOzV4lD-dlWUP6F0OBb2dmRzP9o188EFBR3fiKAnHY60B-oBY-0DYmzcBeAXiAzXjUP_VpqYmzl7CmFpPP9s-F1pGnveXgGKoiz2BHOop0Gpt4bpF2rBzVg5P_mEtTnGpI/s16000-rw/20240205-054145%20Media%20Downloader%20paquetes%20binarios.png)

**Problema con 'yt-dlp', actualización**
[https://forums.linuxmint.com/viewtopic.php?t=417452](https://forums.linuxmint.com/viewtopic.php?t=417452)

Dios les bendiga
