# Cómo instalar y usar Jack Audio Connection Kit JACK

**Actualización Abril 2025.-** Este tutorial no funcionará en MX Linux 23 basado en Debian 12 ni ningún Linux que use PipeWire, al menos que deshabilite PipeWire para usar PulseAudio. Vea [aquí los pasos](https://facilitarelsoftwarelibre.blogspot.com/2025/05/como-desabilitar-pipewire-en-linux-basados-en-debian-ubuntu.html). Al momento estoy usando [Debian 12 Netinstall CD](https://facilitarelsoftwarelibre.blogspot.com/search/label/Descargar%20Debian) y allí he instalado LXQT y la instalación usa por defecto Pulseaudio no PipeWire.

## Este tutorial es para Linux que usen PulseAudio

Antes de continuar les digo que para mí un Kernel es como las llantas de un auto, uno las puede cambiar por otras las cuales pueden tener otro labrado que pueda servir mejor para tal o cual terreno, pero primero hay que apagar el auto y luego hacer el cambio. Así mismo es con el Kernel, el que vamos a usar ha sido creado para un propósito especial, para Audio, y para cambiarlo debemos de instalarlo y luego reiniciar el ordenador y elegirlo en el Grub para iniciar sesión con él.

## ¿Por qué hice este tutorial?

- Porque cada vez escasea más software para 32 bits. Ejemplo [AV Linux](https://www.bandshed.net/) ya no tiene una versión de 32 bits como antes la tenía en el 2022 (UbuntuStudio dejó hace años de tenerla).
- Porque si ustedes usan un Linux en particular y no quieran usar [AV Linux](https://www.bandshed.net/) o [Ubuntu Studio](https://ubuntustudio.org/) (los cuales tienen instalado y configurado JACK listo para usar) podrán aprender aquí cómo configurar su Sistema Operativo Linux para que funcione igual.
- Porque puede que ustedes quieran usar el ordenador para grabar desde el micrófono y que se grabe al mismo tiempo una pista de Karaoke que esté sonando y que esto se escuche al mismo tiempo por los parlantes; esto se puede hacer ejemplo con Ardour y se llama Stereo Mix (en Windows hay algo parecido que se puede hacer con [Virtual Audio Cable](https://vb-audio.com/Cable/)) pero esto solo se logra sin ruidos molestosos con el Kernel de AV Linux que hizo Trulan (explicado en este tutorial).
- Porque puede que Ud. quiera usar bajas latencias para algún programa de Audio.
- Para editar audio con Audacity y que no haya un retardo mientras uno le da Play a alguna parte en específico de la onda de la pista de audio y lo que se oye por los parlantes (se puede instalar y usar el Kernel Real Time que vienen en los repositorios de Debian, o el de AV Linux).
- Porque puede que envíen algún Kernel nuevo en el que hayan quitado alguna característica, ejemplo en el Kernel 6 no puedo ponerle [75 Hz de Frecuencia de Actualización al monitor](https://facilitarelsoftwarelibre.blogspot.com/search/label/75%20Hz) de esa laptop.

## ¿Qué es la baja latencia en el Kernel?

Para usar en un sistema operativo bajas latencias lo puedo explicar con mis palabras, significa que haya un retardo mínimo casi imperceptible ejemplo en el audio que se transmite desde un micrófono hasta los parlantes de un ordenador u otro dispositivo conectado, para esto necesitamos usar un Kernel especial llamado Kernel Realtime, en contraste en AV Linux o UbuntuStudio ya viene todo configurado, y esas mismas configuraciones las vamos a aprender a usar. Este tutorial es para Sistemas basados en Debian, pero tal vez lo podrían adaptar para otro Linux.

## Probado en

Este tutorial ha sido testeado en:
- MX Linux 19 de 32 bit
- antiX 19 de 32 bit
- MX Linux 21 de 32 bit
- Debian 12 bookworm 32 bit

## Debería de funcionar en Sistemas Operativos

Basados en [Debian](https://distrowatch.com/table.php?distribution=debian) como son: [MX Linux](https://distrowatch.com/table.php?distribution=mx), [Deepin](https://distrowatch.com/table.php?distribution=deepin), [antiX](https://distrowatch.com/table.php?distribution=antix), [Kali](https://distrowatch.com/table.php?distribution=kali), [Sparky](https://distrowatch.com/table.php?distribution=sparky), [Parrot](https://distrowatch.com/table.php?distribution=parrot), [Tails](https://distrowatch.com/table.php?distribution=tails), [Q4OS](https://distrowatch.com/table.php?distribution=q4os), [PureOS](https://distrowatch.com/table.php?distribution=pureos), [Voyager Live](https://distrowatch.com/table.php?distribution=voyager), [Volumio](https://distrowatch.com/table.php?distribution=volumio), [Raspbian](https://distrowatch.com/table.php?distribution=raspbian), [Whonix](https://distrowatch.com/table.php?distribution=whonix), [Slax](https://distrowatch.com/table.php?distribution=slax), [SteamOS](https://distrowatch.com/table.php?distribution=steamos), [AV Linux](https://distrowatch.com/table.php?distribution=avlinux), [SolydXK](https://distrowatch.com/table.php?distribution=solydxk), [Pardus](https://distrowatch.com/table.php?distribution=pardus), [Proxmox](https://distrowatch.com/table.php?distribution=proxmox), [Academic GNU/Linux](https://distrowatch.com/table.php?distribution=academix), [Univention Corporate Server](https://distrowatch.com/table.php?distribution=univention), [Debian Edu/Skolelinux](https://distrowatch.com/table.php?distribution=skolelinux), [Linux Mint Debian Edition](https://linuxmint.com/download_lmde.php), etc.

## ¿Cómo instalaremos la baja latencia?

Aquí dejo unas opciones, escojan según necesiten. La primera opción que dejo es el Kernel de AV Linux (por el desarrollador original Trulan), he hecho unas instrucciones de cómo compilarlo. La segunda opción es usando un Kernel RT de Debian que está en los repositorios, y además les dejo un tutorial para que si ustedes necesiten usar uno de esos Kernel más antiguos lo puedan compilar.

### 1.1 opción - Instalar el Kernel de Tiempo Real de Debian o Ubuntu

En Debian hay unos paquetes de Kernel llamados **rt** (Realtime = Tiempo Real), un Kernel consta generalmente de dos partes, están en los repositorios de la Distro pero si desean los pueden buscar así:

- [https://packages.debian.org/search?keywords=linux-headers-rt](https://packages.debian.org/search?keywords=linux-headers-rt)
- [https://packages.debian.org/search?keywords=linux-image-rt](https://packages.debian.org/search?keywords=linux-image-rt)

Los he probado y me funciona bien con **"Jack Audio Connection Kit (JACK)"** (pero mejor funcionan los de AV Linux que hizo Trulan).

En los paquetes de Ubuntu online pueden encontrar los dos en el siguiente link:
[https://packages.ubuntu.com/linux-lowlatency](https://packages.ubuntu.com/linux-lowlatency)

#### Instalando el Kernel en Tiempo Real (Real Time) de los repositorios de Debian

Las siguientes instrucciones son para un Sistema Operativo basado en Debian. Primero es necesario recargar los repositorios:

```bash
sudo apt-get update
```

Luego instalar las actualizaciones si es que las hay:

```bash
sudo apt-get upgrade
```

**Nota:** Los siguientes dos paquetes que tienen dentro del nombre: image y headers son paquetes de configuración que instalan automáticamente el último Kernel RT que esté disponible.

#### Instalar Kernel Realtime para 32 bits desde Debian repo

Si su ordenador usa 32 bits, poner en la terminal:

```bash
sudo apt-get install dkms linux-image-rt-686-pae linux-headers-rt-686-pae
```

Aquí pondré una captura de pantalla de la instalación en 32 bits:

![Instalación en 32 bits](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUeAFdSWDZPy4sOzdtX3p6gp2b-Ky3zlmCBIEXvaL5pJowuUc8lOFO5WMEDDv77qxp-tJ8FUN440uDeuCA4ZdKeOzMu0ovU7pP-gzlnyCRnuTDLjYl30jH2U8QH7EW2PB25iuGmIF5x2g/s964/20201004-171053.png)

Puede investigar sobre ellos también en línea en los paquetes de Debian:
- [https://packages.debian.org/linux-image-rt-686-pae](https://packages.debian.org/linux-image-rt-686-pae)
- [https://packages.debian.org/linux-headers-rt-686-pae](https://packages.debian.org/linux-headers-rt-686-pae)

**Para desinstalar los paquetes actualizadores automáticos del kernel RT**

Estos paquetes sirven para que cuando envíen una nueva actualización del Kernel para que cuando usted aplique todas las actualizaciones del sistema se instale automáticamente la última versión del Kernel y además que esté disponible en primer orden en el Grub, para desinstalar (no se preocupe no se desinstalarán los Kernel RT):

```bash
sudo apt-get remove linux-image-rt-686-pae linux-headers-rt-686-pae
```

Podría no convenirle tener esos paquetes porque en alguna máquina usted use Windows y no quiere que se le ponga en primer lugar Linux (lo cual tendría que arreglar otra vez con grub-customizer) u otra razón.

#### Instalar Kernel Realtime para 64 bits desde Debian repo

Si su ordenador usa 64 bits, poner en la terminal:

```bash
sudo apt-get install dkms linux-image-rt-amd64 linux-headers-rt-amd64
```

Puede ver información de esos paquetes aquí:
- [https://packages.debian.org/linux-image-rt-amd64](https://packages.debian.org/linux-image-rt-amd64)
- [https://packages.debian.org/linux-headers-rt-amd64](https://packages.debian.org/linux-headers-rt-amd64)

**Para desinstalar**

Ponga en la terminal:

```bash
sudo apt-get remove linux-image-rt-amd64 linux-headers-rt-amd64
```

Recuerde que esto no hace que los Kernel que usted tenía instalados se desinstalen.

#### Instalando los paquetes del Kernel Real Time desde Synaptic

También si desea puede buscarlos uno por uno en Synaptic. Las siguientes capturas de pantalla son de MX Linux 21 de 32 bit:

**linux-image-rt-686-pae**

![linux-image-rt-686-pae](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiBEtuKDvz8cDOWAo72jauFTmT0ji5FxLJyVzGl8Uzd43Zb1FWDqgm1l0xszQ1v51jy4dGIQ9eKOQLGY-ozlmQmfVc0-Ad_xZv5yb_szBlFrAloH9VZ1K0blzSZbm4GfbF-eULfkS7mojxEA5B8GF0EJLTmKhEbElI9ACvjPshQKClBbzR4_6ET9FAr2Rk/s778/20240314-184220%20linux-image-rt-686-pae%20en%20MX%20Linux%2021.png)

Luego:

**linux-headers-rt-686-pae**

![linux-headers-rt-686-pae](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicJ7faXuU_MI0fBRbKhNrGOitN9oNNo6xqyAo2xfGBcjWaxvVq2QASPU4KFS2i-0csUsEPAaaZUiG_6t5Q_qjmz0RXDfr_C8_GGPohA305m_9zefYfy8D3fa6RLc_0KAnxbojgswh4pEmpqGhcVsOHWSsNW-FWfFYcekeDSoZgKXAL9jkM1Mfz2pL4x1U/s679/20240314-184406%20linux-headers-rt-686-pae%20en%20MX%20Linux%2021.png)

Y:

**dkms**

![dkms](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgMgHvBRGsPWDcUmcFRZHVsQ6iS1yanZazJ2qpVdcPD5rUK3elWsu6QLTubvoOEtwoyEyAfK20LkmQCajO9iiAOeZY_3qQZn6KgpMTZROstKMH9fcM_D1q0V-NFX2O6QraOs2mvTie1lWeXQv51Sy5fr_dsLAfqOsL_D89gw2RWvj3-1pVpPE7ThbSPvfQ/s773/20240314-184517%20dkms.png)

La siguiente captura de pantalla es en synaptic viendo cómo se instala el Kernel Real Time en MX Linux 21:

![Instalación en Synaptic](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrD6i4_WCB4tdHzrf_pjy4Es3NLMMeKx2a-mBvzV3IbFytbw7ud1imSm_ty3LCS4eLwwmEFAqHGZBMMEVQZyZ0_chZ1aZjBtbt3uh2Wb1IyiFrtDOgwF9X0ffprcsX0kiVIbSgmxafVwYOlmzC-tOMqmf__HlcKiMeJss_QSzTeSF1kfsks4U7pPdew64/s742/20240314-193755%20en%20synaptic%20viendo%20c%C3%B3mo%20se%20instala%20el%20Kernel%20Real%20Time%20en%20MX%20Linux%2021.png)

Se demora bastante.

### 1.2 opción - Compilar usted mismo el Kernel Real Time

Esto podría ser útil si usted tenga un ordenador de bajos recursos al que le quiera poner un Kernel que no tiene tantos drivers modernos incluidos, o sea un Kernel más liviano (más viejo), como dice el dicho: "La cosa es probando", pruébelo a ver cómo le va, además de que con los Kernel modernos puede que algo de su hardware no funcione, ejemplo el lector de tarjetas SD u otro lo cual sí debería funcionar con un Kernel viejo, vea:

[https://facilitarelsoftwarelibre.blogspot.com/search/label/Compilar%20Kernel%20Real%20Time](https://facilitarelsoftwarelibre.blogspot.com/search/label/Compilar%20Kernel%20Real%20Time)

También podría querer compilar usted mismo el Kernel para personalizarlo, ejemplo yo generalmente le deshabilito los módulos la máquina virtual Guest y Host ya que no voy a usar el Sistema en ninguno de los dos casos.

### 2.0 Kernel Liquorix en el instalador de paquetes de MX Linux 64 bit

Esto no lo he hecho, pero he leído que se puede instalar este Kernel desde el instalador de paquetes de MX Linux:

![Kernel Liquorix](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgrGkb-azp6EDgB9p31dZxcmWNeyLqQEY9ugL0vSRbG9Cvuk4tVo5eez0gtBD03OHazT-CC-6sWdipNsIEl9gPNcXNjJjXJtBDzC52y9tHoA-bCUGnn6POlHUqpllGQRKYAZLf523wedmq_0yKeSz0mqZGpnNCZHYFymTGFGeNYCxlqz_Ys1P5Nj0GsXnM/s677/20250524-000414%20Kernel%20Liquorix%20en%20el%20instalador%20de%20paquetes%20de%20MX%20Linux%2064%20bit.png)

Si usas Debian y deseas instalar ese programa de MX Linux, instala el repositorio de MX Linux siguiendo este tutorial:

**Instalar el repositorio de MX Linux en Debian 12, 11, 10 y Sistemas Operativos Linux basados en el, y el instalador MX Instalar paquetes para instalar Ksnip, yt-dlp, otros**

[https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html](https://facilitarelsoftwarelibre.blogspot.com/2023/11/como-anadir-el-repositorio-de-mx-linux-en-basados-en-debian.html)

### 3.0 Opción - instalar el Kernel de AV Linux (obsoleta)

He hecho un manual de cómo compilarlo y esto eso es aplicable a 32 y 64 bits, en:

**Compilando Kernel de AV Linux en MX Linux 19 de 32 bits (Trulan)**

[https://facilitarelsoftwarelibre.blogspot.com/2022/04/compilando-kernel-de-av-linux-en-mx.html](https://facilitarelsoftwarelibre.blogspot.com/2022/04/compilando-kernel-de-av-linux-en-mx.html)

Allí en el tutorial he podido crear los deb de un Kernel de 32 bit el cual lo pueden descargar e instalar para usar, allí les explico en esa entrada todo al respecto. Y con las instrucciones allí ustedes podrán compilar uno de esos Kernel de AV Linux si no desean usar el mío o deseen probar alguna de esas versiones por algún motivo o necesidad depende de qué ordenador tengan sea viejo o moderno y sea de 32 o 64 bit (calculen más o menos la fecha de fabricación del ordenador y la del Kernel, entre más cerca estén mejor).

También les quiero decir que viejo no significa obsoleto, esto en cuanto al Kernel de AV Linux original hecho por Trulan el cual ya no está en desarrollo, funciona de maravilla para hacer Stereo Mix, pero ya no tiene las correcciones de seguridad para los errores de seguridad que se vayan encontrando con el paso del tiempo en el Kernel. Pero yo lo veo así, si uno va a navegar en páginas seguras pues no tenemos nada de que preocuparnos (además aconsejo usar [https://www.mywot.com/download](https://www.mywot.com/download) u otro semejante), excepto que alguien quiera navegar buscando cracks, o parches de programas de Windows o entrar en páginas malas, allí si se expone a que vulneren su seguridad usando el Kernel de AV Linux que hizo Trulan. También lo veo de la siguiente manera, se lo puede usar cuando uno hace audio y luego reiniciar el ordenador y usar el que vino en la Distribución Linux y ya está si quieran hacer alguna consulta o investigación de algo donde haya páginas que no aparezcan en mywot.com.

## Instalar los paquetes para usar Jack Audio Connection Kit (JACK)

Ahora sí, después de ya instalado un Kernel RT, la siguiente lista de paquetes que debemos de instalar es para una Distro basada en Debian (no sé si todos funcionarán en alguna Distro basada en Ubuntu pero pueden probar).

Los siguientes son los paquetes más usuales para usar con JACK, Ud. copie de una sola vez las siguientes tres líneas y póngalas en la terminal:

```bash
sudo apt install ardour pulseaudio-module-jack qjackctl mediainfo-gui \
     calf-plugins amb-plugins tap-plugins fluid-soundfont-gm \
     dssi-host-jack dssi-utils pavucontrol a2jmidid qsynth vmpk \
     jack-keyboard jack-tools meterbridge jackd2-firewire git muse
```

De ENTER y siga los pasos:

![Instalación](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjAx2XImgsP-2o_IG360b75L_oT6sKqPsmtUISYFW_iHs5GDuhLQ1NgXs9w9D4OB1MeOeXanhpwb4Zbd53URaiXjjLVlho47Fo6zCBlorz0psij4qX7X87r4qEV_4HR5YKAUJXDtp8CN2I/s16000/20210317-011624.png)

**Nota:** Usen un editor de texto que les guste, aquí verán a Gedit algunas veces.

### Configuración de jackd2

Cuando empiece la instalación habrá un momento en que puede que le aparecerá así:

![Configuración jackd2](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiv6AMTOXSTN309WXMMTL0nkHvfy2hX_rtaY544OwhFJIIOQqdWIlJLg1Sdh9bsMdwAcTDOwb2cN95deBSVTF66KiZ_i8fT9SI_z3z6IZdwHQsBhx0Yd8_yxAdPuTCOMhDgDfCA12sLChs/s640/Selecci%25C3%25B3n_006.png)

Póngale que sí de acuerdo donde esté con las flechas del teclado y luego de ENTER.

Aunque también puede aparecerle así:

![Habilitar prioridad en tiempo real](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjJ2dFyOPPmbWqluBHOpXthHa9JJ_Pte7RNTSu3WvyTAup22AuelZbP3_-mGaj6rUk24VBq2wBXR6G74awUypXpSxJMPmOuRaO1-VArGedOkEZgDCnG5DTVVB8WN1d71ttD1apLwSH2Vhk-fjmEQaP0kdyEcLptfjwkYiXD6Bs2wifls25hlPSZn79HCII/s799/20240311-093947%20marcar%20habilitar%20la%20prioridad%20en%20tiempo%20real.png)

Como sea siga las instrucciones.

Ahora bien, si por un caso se confundió y aplastó ENTER en "No" o no Marcó la instrucción y no se configuró el sistema con RealTime pues vuelva a intentarlo, para eso ponga en la terminal este comando:

```bash
sudo dpkg-reconfigure -p high jackd2
```

Y allí sí confírmelo.

**Nota:** Antes aquí yo tenía una sección donde explicaba cómo hacer una verificación del grupo de audio cuando se instala el Kernel en Tiempo Real, pero la he quitado debido a que en los Sistemas Operativos Linux eso ya viene configurado al hacer la instalación, pero lo he dejado como consulta [aquí](https://facilitarelsoftwarelibre.blogspot.com/2024/03/verificando-el-grupo-audio-en-el-kernel-real-time.html).

**Reiniciar** y debe elegir el Kernel Real Time, aquí les dejo un video:

**VIDEO:**
El siguiente es un video que hice de cómo elegí en el Grub al Kernel RT al reiniciar el ordenador:

[![Eligiendo el Kernel Real Time en MX 19](https://img.youtube.com/vi/kN_jFjBW21U/0.jpg)](https://youtu.be/kN_jFjBW21U)

Si por un caso no se vea sincronizado el audio con el video mejor abran el video aparte:

**Eligiendo el Kernel Real Time en MX 19**
[https://youtu.be/kN_jFjBW21U](https://youtu.be/kN_jFjBW21U)

**Nota:** Cuando se inicia sesión hay la opción en MX Linux de elegir entre el Kernel con Systemd y sin Systemd, esto es importante entenderlo porque puede ser el caso de que alguna aplicación pueda necesitar Systemd y si fuera así sólo lo eligen al inicio en las opciones avanzadas del Grub, ejemplo, el viernes 14 de Marzo de 2025 instalé el Kernel Real Time en MX Linux 23 KDE y funciona todo bien en la sesión por defecto de KDE, pero luego instalé el administrador (o gestor) de ventanas Openbox y al querer entrar con el Kernel Real Time en la sesión de OpenBox no podía, pero reinicié y elegí la opción del Kernel con Systemd y pude entrar y todo funcionó bien otra vez, ufff (lo pueden dejar elegido con grub-customizer).

### Posibles problemas (Solución instalar un Kernel antiguo y dejarlo seleccionado para iniciar, con grub-customizer)

No debería haber ningún problema, pero MX Linux como las demás distribuciones también como Ubuntu, envían frecuentemente nuevos kernels, y si ustedes instalan alguno de los nuevos puede ser que alguno de ellos le cause algún problema como por ejemplo lo que les explicaba en el video que no me quería coger la Memoria SD. En ese caso puede usar alguna de las versiones anteriores del Kernel que les funcionaba bien, para ello pueden usar grub-customizer para elegir el Kernel que necesiten.

La siguiente captura de pantalla es después de instalar el Kernel Real Time de los repositorios de Debian en MX Linux 21 visto en Grub-Customizer:

![Grub-Customizer](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiVoN9i-TOgw_fxDwccvshGDzO3H_XMQw2LH-587jLC24mrirtT_WxOCHMFe7jK-b1ydblqyIY8CIOaDOqG0IJblWWow9NIEUv_0EC8lB8FpDEnoCo5cQ3DOTTeRmIBq6HxvOHTo0M-SA996FDJnOI-GaAhv4N1daZAeCf6FrHtRgtiKHhsoGcMPSKER6w/s900/20240314-201943%20despu%C3%A9s%20de%20instalar%20el%20Kernel%20Real%20Time%20de%20los%20repositorios%20de%20Debian%20en%20Synaptic.png)

**Nota:** Cuando le envíen actualizaciones y usted además actualice el Kernel se moverán las cosas en grub-customizer así que debe abrirlo y arreglar todo como quiere que funcione (si desea puede poner Windows al final y luego el Kernel de Linux Real Time o como usted desee).

Pero les cuento que ese Kernel 5.10.0-28 en el ordenador de escritorio que armé con la tarjeta madre que me regaló mi primo Paco información de la misma la cual se puede conocer poniendo en una terminal:

```bash
sudo dmidecode -t 2
```

Y me da:

![Información de la tarjeta madre](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEju8BJ3vhDu3gFnZabZCzQJrsbPXIYnj9uPILVtr8szZZLXzcO3XfoxXqSR3KRpfBRVIFnPe6YmlXOOrsf522Xtby40f4ZkElD3NHHtnCKqTpzMeUspPVsDUn-snxoyWyKoSn-l5jRB8P1lUsLU9YmsnPg4PMTS56uMtpjuHpxfrbOfB7Mlm0Irem4zrX8/s407/20240123-232532%20C%C3%B3mo%20saber%20qu%C3%A9%20placa%20base%20tengo%20en%20linux.png)

Con lo cual sé que es una:
ASUSTek Computer INC. LEONITE Version: 5.00 Serial Number: MS1C6CS29109829

Les cuento que a veces al encender el ordenador y en el grub al elegir ese Kernel 5.10.0-28 a veces se cuelga y no se puede poner la contraseña para entrar. Pero el otro Kernel 5.6 de AV Linux el que yo [compilé](https://facilitarelsoftwarelibre.blogspot.com/2022/04/compilando-kernel-de-av-linux-en-mx.html) siempre va bien, nunca se cuelga esta PC, será porque es muy muy vieja y es más compatible el Kernel 5.6, por tal motivo mejor pongo que se inicie el Kernel de Trulan en Grub-customizer:

![Poner Kernel 5.6 primero](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhYYuuuLBQEpmRc2Vc_SYKB0OzjYDklDtTzngGOVcYW5LbY57s7KxupnO8TgQmdsDo7YMZLRLn3qFJA10Mfgj9Dh_3dWYGH8DWyb0pWaKKj6FaUqN2Tsg0hrkurLGoMlNTC7hif2DAwZY4vMI8necaHhnXRDHp0ghHkoCBBApcaZROhwlRUp1SqedeCo2Q/s600/PonerKernel5.6-primero.gif)

Así cuando inicie no tendré que perder tiempo buscando al Kernel de Trulan (Si fuera la primera vez que usted instala Grub-Customizer es posible tenga que buscar en: "Advanced options . . ." el Kernel de Trulan). Lo que les quiero decir es que deben usar un Kernel que funcione bien en sus máquinas.

### ¿Cómo saber cuál Kernel estoy usando?

Ponga en la terminal:

```bash
uname -r
```

A mi me devuelve en el caso de estar usando el Kernel RT de los repositorios de Debian:

![uname -r](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRWkR6wZyIBihc0ZWztzzqApDKW4qrVnluFRf1RlFl_RCHjTZ8GbLbab_uLO1yWghGrYs67G2IKqTlC_5yKmVapbPgYwICcl6gbsqoEZg7hDzce3ZOBayO8HWQWWW6fagBFercz90BfQ4/s684/20201005-122207.png)

Para este tutorial usted ya debe estar usando el Kernel Real Time que haya instalado.

### Verificar "real-time priority" y "memlock"

Para verificar si las aplicaciones del grupo audio tienen prioridad en tiempo real 95 y si el [tamaño máximo que se puede bloquear en la memoria es infinito](https://stackoverflow.com/questions/974636/what-does-ulimit-l-mean), esto significa que las [aplicaciones de audio tendrán prioridad en tiempo real y pueden usar toda la memoria que quieran](https://discourse.ardour.org/t/your-system-has-a-limit-to-locked-memory-solution/86813/4) con prioridad sobre cualquier otra aplicación incluso si usted no se tiene cuidado se podría congelar el sistema operativo si no tiene mucha memoria el ordenador -hay que cuidar no tener aplicaciones innecesarias abiertas en ordenadores que no tengan mucha memoria- ponga en la terminal:

```bash
ulimit -r -l
```

Debe darle un resultado como este:

![ulimit -r -l](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgRJpI8lYirYaI6J-CitSV472G2xD8o1A1qefJZarWhtcHbOevxPjK_r98nqnBgb147oX5J3zps-p9EXGZ4NUbwni8wwnDjtjU_TnQsE62FxMjRxlQG4GZAPzTqFpp19xN73hY8hbowFHg/s690/20201005-122447.png)

Si les sale cero en "real-time priority" y si en "max locked memory" no le aparece "unlimited" y les aparece algún número es que está mal configurado, lo cual significaría que usted se equivocó en algún paso.

## Checkeando la configuración de Audio en Tiempo Real

El siguiente es un programa creado por [raboof](https://github.com/raboof) para ver si todo está configurado bien para el audio en tiempo real:

**raboof/realtimeconfigquickscan: Linux configuration checker for systems to be used for real-time audio**

[https://github.com/raboof/realtimeconfigquickscan](https://github.com/raboof/realtimeconfigquickscan)

Se llama **realtimeconfigquickscan**, para instalarlo primero necesitamos instalar la siguiente dependencia:

```bash
sudo apt install perl-tk
```

**Nota:** Es posible que les pida instalar algo más, eso se vería en la terminal en algún mensaje de error y allí tendrían que copiar partes de lo que dice y buscar en Google la solución del paquete que faltaría (espero no pase, aunque no creo que eso pase).

**realtimeconfigquickscan en AV Linux (AVL-MXE)**

![RT Diagnostic](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgOkZHLGO66ZoHvpFttsXqw4rapjsxxFilFJQtRQI6iFbxQwVzREyc745bdos1hfWvC5LVmpv2WG4Me1nJ97Sh6XP92x2yElgIYnhAm9S482U0zQH_LSttYGMZwYomPSy0zk_-o83D7FUw/s16000/MX+Tools+-+RT+Diagnostic.png)

Esto estaba en:

**MX Tools / RT Diagnostic**

Y como ven en la imagen todas las opciones están activadas (en verde):

```
Checking if you are root no good
Checking filesystem 'noatime' parameter 5.9.1 kernel good
Checking CPU Governors CPU O: 'performance' CPU 1: 'performance' good
Checking swappiness 10 good
Checking for resource-intensive background processes none found good
Checking checking sysctl inotify max_user_watches >= 524288 good
Checking access to the high precision event timer readable good
Checking access to the real-time clock readable good
Checking whether you're in the 'audio' group yes good
Checking for multiple 'audio' groups no good
Checking the ability to prioritize processes with chrt yes good
Checking kernel support for high resolution timers found good
Kernel with Real-Time Preemption found good
Checking if kernel system timer is high-resolution found good
Checking kernel support for tickless timer found good
```

Así que eso mismo es lo que vamos a hacer nosotros.

Bien, en una carpeta o si no tiene una para esto cree una y dentro abra una terminal y allí hay que poner uno por uno los siguientes tres comandos (vamos a instalar un Fork que yo hice del programa de raboof, donde lo único que añadí fue un lanzador):

```bash
git clone https://github.com/wachin/realtimeconfigquickscan
cd realtimeconfigquickscan
perl ./QuickScan.pl
```

Y este es el resultado en MX Linux 21 de 32 bits:

![QuickScan](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg7gdq2ikbJHrfa0dJIPxCQXDIUS79EJrL9xLJKrlNqUleK6TkBR11hFVfcCWnV_M30IZCH132_PL9ikBo-M_4EFzYs-3M_qhg1ek4mdl38BLMykQIcN6b7b4yrHjx2xY7wNhj1uK28xms/s16000/2da+parte%252C+checkeada.png)

**Nota:** Luego en otra ocasión cuando ustedes ya hayan apagado el ordenador y lo vuelvan a encender para lanzar este programa deberán entrar otra vez en la carpeta del programa (donde sea que la haya puesto) y desde allí lanzarlo, sería así:

```bash
cd realtimeconfigquickscan
perl ./QuickScan.pl
```

![QuickScan](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhLSwr35OOeKP7jHv8f9uWgFtnN04P6JPBLROcL3xGsinbxg-TkzaTJmexZutAL58zTPdd6JdXucgUMsuXYIahwEJv-6snOho2yIpnhO7FsM_RTwgOB1KSUFRqPiAFJxbT8i2nnzhLuWG8/s16000/20210928-081857.png)

O también pueden usar un lanzador que he creado para abrirlo con facilidad (está allí mismo, es lo único que he añadido al fork que hice de raboof), en Dolphin funciona:

![Lanzador](https://blogger.googleusercontent.com/img/a/AVvXsEiJhqj8pjt-DYRN6BlD_GTABISTI6YzJvD_IryKm-8vSbTr7LRzwHKQEc05ujPYocEQiytwihBy-l0mEUmelbFywkNdXeoEShCzf4i_G2xAlXv9z5RQhLJZ5eBuGdMW0lITsjwYtlTPsFHdsKM7DcknQr-fH2wcpyOKnBzccmJVlQbftF6IacVFZb6l=s16000)

En Thunar deberán añadir primero el poder abrir los archivos .sh con bash eso se hace con clic derecho.

### Verificaciones por realizar

Veo que me faltaban estos tres:
- checking cpu governors
- checking swappiness
- checking sysctl inotify max_user_watches

Porque dice allí: "**not good**"

**Nota:** Si en algún Kernel les aparece: "Checking the ability to priorize processes with chrt" esto después de configurar lo siguiente desaparece cuando uno ha reiniciado el ordenador.

## Checking cpu governor

Aquí les pondré una parte de una lectura:

**System configuration [Linux-Sound]**

[https://wiki.linuxaudio.org/wiki/system_configuration](https://wiki.linuxaudio.org/wiki/system_configuration)

![System configuration](https://blogger.googleusercontent.com/img/a/AVvXsEhM3RkaWa-JiYpcgGzjjKEWboNlXEgqAt_gp50nB85FR6FGjMMISHC5ywmroOroGhX2MFiAhm9c7xwtIfvI0cu_TkZW6L5-41iWSRVnJx0MoIH446C_sjjAVcZslOa2edv_cdTmjtWzpovxPqounNuNgBTqtx5UrJJegRM9Gw-bgDMqFfM4wIxOY1Nz=s16000)

Traducción posible:

> Si su CPU admite el escalado de frecuencia y el gobernador de escalado de frecuencia de la CPU está configurado a demanda (que es el valor predeterminado en muchas distribuciones), podría encontrarse con xruns. El gobernador bajo demanda escala la frecuencia de acuerdo con la carga de la CPU, cuanto mayor sea la carga, mayor será la frecuencia. Pero esto está sucediendo independientemente de la carga de DSP en su sistema, por lo que podría suceder que la carga de DSP aumente repentinamente, por ejemplo, exigiendo más potencia de CPU, y que el daemon de escala se active demasiado tarde, lo que resultará en xruns porque la carga de DSP alcanza su máximo. Una solución sería usar un daemon de escalado de frecuencia de CPU que escala la frecuencia de acuerdo con la carga de DSP en su sistema como jackfreqd o simplemente deshabilitar el escalado de frecuencia de CPU por completo. Esto último se puede lograr configurando el regulador de escala en rendimiento.

Esto quiere decir que como la CPU está configurada por defecto a demanda tendrá un bajo consumo de energía y creará eventos de latencia larga que producirán xruns (ruidos), para evitar esto hay establecer la CPU en configuración performance (rendimiento), le dejo dos opciones posibles, debe leer ambas para entender todo:

### Cambiar cpu governor desde la configuración del sistema a performance y dejar el cambio permanente

Haremos uso de una aplicación que viene instalada por defecto en MX Linux y que me supongo que en otros Linux también, se llama: [cpufrequtils](https://askubuntu.com/a/1406529/145772) y se puede ver en Synaptic instalada:

![cpufrequtils](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhKn3xOQO3-hG8QCdfavYhFp88k0yKO5PRUa0B6LcrxtNglJRNUnmnCLl4PVYDG5PtFCWeHrItW5K4K5tVpIb6wGPKvAa0AMNYPl_SOVzgKEP6_OYiJahbMYLvpzqbQUs0AHtWbbCMW7hKWJsz8M3noLwCbjxlrDU82QnyMHEYfZrRPzi1I8_dI8yLEq_4/s698/20240314-105920%20verificando%20cpufrequtils%20en%20synaptic.png)

En caso de que no esté instalado instálelo desde Synaptic o desde la terminal:

```bash
sudo apt install linux-cpupower cpufrequtils
```

Ahora debo editar el archivo de configuración, para hacer esto usaré Gedit (usted puede usar otro, o también nano si su Sistema Linux no les dejara usar el editor de Texto al elevar los privilegios -pero nano es difícil de usar- deberá cambiarlo allí), pongo en la terminal:

```bash
sudo gedit /etc/init.d/cpufrequtils
```

Con Featherpad:

```bash
sudo featherpad /etc/init.d/cpufrequtils
```

Con Geany:

```bash
sudo geany /etc/init.d/cpufrequtils
```

Con nano:

```bash
sudo nano /etc/init.d/cpufrequtils
```

Si no sabe usar nano vea [este tutorial](https://facilitarelsoftwarelibre.blogspot.com/2024/08/como-usar-nano-en-linux.html).

Es una aplicación que sirve para configurar el desempeño del procesador de su ordenador, y debo de cambiar en:

```bash
GOVERNOR="ondemand"
```

Por:

```bash
GOVERNOR="performance"
```

Así:

![Cambiar configuración](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhKAx0SapgyFCVH_wYGUa02sVcA79TolHKPDOMgQ2KVacO0XN0jekXPhi6x1HfEIIiiTCB5AsASs6AuV1Oi2uT_6Zew7_k73NqA0Ptfr-Lzb2JnruQeefh0s7geTU5QgVN2ka_wywek2wBgYgRkvLaIfoB7-9UbjYD9eRSnSr-fnpiYel-aAyv7anxx2hY/s656/20240314-105536%20cambiar%20la%20configuraci%C3%B3n%20de%20cpufreq.png)

Guarde y deje abierto.

### Cambiar cpu governor con cpupower-gui (OPCIONAL, no queda permanente el cambio)

Si ustedes por ejemplo usen una laptop y quieran usarla y ahorrar batería sería bueno que no usen el método de arriba sino que lo dejen como está y que instalen esta aplicación la cual es una interfaz gráfica, y se puede elegir cualquier modo del gobernador del cpu, pero no queda guardado el cambio.

Podemos usar cpupower-gui, revisemos su disponibilidad en:

[https://packages.debian.org/cpupower-gui](https://packages.debian.org/cpupower-gui)

A la fecha 23 de Mayo de 2025 que reviso, la veo en Debian 11 bullseye, y no la veo en Debian 12 bookworm, pero si la veo en testing y unstable, entonces en Debian 13 puede que la pongan otra vez.

Para instalar:

```bash
sudo apt install cpupower-gui
```

Una vez instalado busque entre sus aplicaciones a:

**cpupower-gui**

![cpupower-gui](https://blogger.googleusercontent.com/img/a/AVvXsEilZby0Jr9pO0pNsAbIdwyBzU9Y-iCjc-xjXXHIPO03T24lFu7Tk3HQcfi7QOmryXHNSylDCfC5jNbT3-z8ff5OO9wZn6B8u36EHsx9mkSCC9_B1yY7YcZ7iEzWwIIMTyK5jXRgKeoFUPSTHJycIJGI1GtdS88Eed4L45q3jgoqkuctm094zdtdqUz9=s16000)

Ábralo, y elija uno de los modos que necesite, en este caso performance:

![performance](https://blogger.googleusercontent.com/img/a/AVvXsEjJYVAvHJQ73Qk8VE2sm-glWJjNpCxC0WxFrr0Uk2vewBxCyzhEnLbvYJ0xGX1e4F9Yld10Ig627W8RmgxAK__SlqGJkbiRdQ8ne5NRsw8d8xoWLn-5d2KOKaLceYbWKNSsDy9-NVdRMDws1UokrF4IxQs6SSBqNFwu-MSI13EjHg0GnzSxxgDmT4JV=s16000)

**Performance** significa que su procesador estará trabajando en su máxima capacidad, y lo único que si usted usa esta configuración en una laptop en la cual use la batería esto hará que se descargue más rápido de lo normal.

Les cuento que en mi ordenador de escritorio yo he usado el primer método y he dejado permanentemente al cpu en modo performance.

Por defecto el Gobernador de la CPU está en:

**Ondemand**

Por todo se pueden manejar los siguientes perfiles:

- powersave
- conservative
- userspace
- ondemand
- performance
- schedutil

Con esta herramienta cpupower-gui tendremos una herramienta como la que viene o venía en AV Linux 2021:

[https://download.linuxaudio.org/avlinux/AVL-MXE/](https://download.linuxaudio.org/avlinux/AVL-MXE/)

![Set CPU Governor](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgSqAl5-XQ6Dpd7rFZmxExVr_Ecv5Q_V8eClFuz4dN0Ay9eNWhtg65tWgGQnvfdL5z6hUJ1rYphFK-0xBrvBEGjQJvemV5vfU8IHpeQaR2eMTM1tZxEjutDCHd9E_VTkcxWguUxxQZZWUk/s16000/Set+CPU+Governor.png)

También les pido que lean la siguiente traducción pues importante saber lo siguiente cuando usemos performance, tomado de:

**How to get low latency audio**

[http://fernandoquiros.com/articles/131123-compile-linux-realtime-kernel/](http://fernandoquiros.com/articles/131123-compile-linux-realtime-kernel/)

Cuya traducción vendría a ser:

> ... importante es ajustar Linux para evitar el escalado de la CPU porque cuando la CPU tiene un bajo consumo de energía, crea eventos de latencia larga que producirán xruns. Una opción es cambiar el gobernador del sistema a "performance". El procesador funcionará a máxima velocidad todo el tiempo y no se interrumpirán los procesos en tiempo real. La computadora se calentará más de lo normal, así que trate de mantenerla ventilada. Puede cambiar el "gobernador" usando "cpufrequtils".

Entonces según esta enseñanza, cuando usemos el ordenador o laptop en performance debemos cuidar de que esté bien ventilado para que no se caliente mucho.

### Cambiar checking swappiness

Ahora debemos configurar el ordenador para evitar que en algún momento use la memoria swap, es decir que siempre use la memoria RAM y nunca use la SWAP, esto es porque si se usara la SWAP esta es más lenta y hará que la velocidad se reduzca y creará que se creen xruns o ruidos en JACK. Si usted tiene curiosidad usted leer sobre cómo ajustar la memoria virtual [aquí](https://ubunlog.com/swappiness-como-ajustar-el-uso-de-la-memoria-virtual/).

Para ver qué valor de swappiness tiene por defecto su Sistema Operativo ponga en una terminal:

```bash
cat /proc/sys/vm/swappiness
```

Me da 15.

![swappiness](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-NKd-xh-dwKz9aRq0H3J8N29kUZxxtlPH_4eDAz90qVCcwfXQfGAzfSn6ZYn406IGXvv0zXNJpPNlYZJq0vEloeN9yXIxCqx-key7obDLtEgWvmyTzsGgZtLSljHBU3yCNW1UcKL-O-o/s16000/20210928-092427.png)

Para que no se use la memoria SWAP debemos hacer que tenga 10 ese valor y para ello poner en la terminal:

```bash
sudo gedit /etc/sysctl.conf
```

Con Featherpad:

```bash
sudo featherpad /etc/sysctl.conf
```

Con Geany:

```bash
sudo geany /etc/sysctl.conf
```

Con nano:

```bash
sudo nano /etc/sysctl.conf
```

Allí se abrirá, y vaya hasta el final:

![sysctl.conf](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjT5Vq8NI5kZidmAS-BWFaQovhd4gfEk_o9V66m7b-2vN58uvm-Ij4FA70ymgb_2wup18K1qcE4JqJNhulszltBWT-d-qItkgNLIOaEaW6Vk9Ii2KoLjuFD8mKGhjo64vcEB_q1QVj_5GY/s16000/20210928-093024.png)

Allí añada la siguiente línea:

```bash
vm.swappiness = 10
```

Le deberá quedar así:

![vm.swappiness](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiXm2kMZ9_KkSeXyE-HnEMm7cYte-UFjsiY4nWhM9-fPwpSh-NxN5o6MPTPbYInHQVeGa9CeuxLSKnRxWmOyZWyj6-ras79TAJ3wyfldBkSUi3d2BSCfkpVzHg9DTWetfNQbAvKuPniTck/s16000/20210928-093229.png)

Guarde y cierre.

Luego poner en una terminal:

```bash
sudo sysctl -p
```

Me devuelve:

![sysctl -p](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiohrvbAg0y-0BmSI-peD0UWoLvhwx3chwt82H7tRfwBIOIylfU5eb8P7LRhGxzZKOedDI8ZBfwMvV4KFI2_GuT7quq1T-sPSeORsaLCFagZI4ikFla-dkY2pYDMDWs6L2aXPt-0eTf1UI/s16000/20210928-104212.png)

Lo cual significa que está bien.

**REINICIE EL ORDENADOR**

Si tiene curiosidad y desea leer más al respecto puede leer (usar el [traductor de google](https://translate.google.com/?sl=en&tl=es&op=websites)):

**Increasing the amount of inotify watchers**

[https://gist.github.com/ntamvl/7c41acee650d376863fd940b99da836f](https://gist.github.com/ntamvl/7c41acee650d376863fd940b99da836f)

**Generic Kernel users: How low can you go, and under what load**

[https://forum.cockos.com/showpost.php?s=380ff3a18229522dd58c72a4e829e674&p=2464865&postcount=6](https://forum.cockos.com/showpost.php?s=380ff3a18229522dd58c72a4e829e674&p=2464865&postcount=6)

[https://forum.cockos.com/showthread.php?t=255727](https://forum.cockos.com/showthread.php?t=255727)

### Escaneando la configuración Real Time en mi Ordenador

Ahora si estando en la terminal en el lugar (sea cual sea) donde tengo a realtimeconfigquickscan pongo el comando y lo lanzo (o si lo tenía usted abierto sólo de clic en start):

```bash
perl ./QuickScan.pl
```

Y al dar clic en start me aparece todo verde (**Recuerden** que para que sean reconocidos los cambios que hemos hecho hay que reiniciar y elegir el Kernel Real Time en las opciones Avanzadas del Grub, de lo contrario nunca aparecerán verdes las opciones que hemos configurado).

**Nota:** La siguiente captura de pantalla es en mi ordenador:

ASUSTek Computer INC. LEONITE Version: 5.00 Serial Number: MS1C6CS29109829

Que pude armar gracias a que mi primo Paco me regaló esa Mainboard. La siguiente imagen es de MX Linux 21 (base Debian 11):

![QuickScan](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg0_wVK6i64A-WT155zdRWcnMn_p6sB0L9ZVjls-3BjOSzNiZ_whyphenhyphen5sqF3wjtlOsoa_qNzyiRBWyLbRvU0Re2XkJ8dWn2dgCyutR4edNGqILN0I64SIfKLf6Y_2s9qevbCfPQmaggvJWNU/s16000/20210928-122126+realtimequickscan.png)

La siguiente captura de pantalla es el chequeo del QuickScan en el Kernel 5.10.0-28-rt-686-pae de los repositorios de Debian en MX Linux 21 tomada el 14 de marzo del 2024 en el mismo ordenador que pude armar gracias a que mi primo Paco me regaló esa Mainboard:

ASUSTek Computer INC. LEONITE Version: 5.00 Serial Number: MS1C6CS29109829

![QuickScan](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0lxkRMh_SwGNhiBfz1u0rU8wj9hhN7amdZyUocGVWOHcVkqP88pGFq0idT5ApdHqPGsK5ryjBh9HkaVTiVEyI3NmaVWa61_hEWTpCxhSp0nscBe7WwT9MV4abZz5RbSk9wfUKZoL9e4nEKDlZ9BLWjPVUdkNheDwC-WZoR4BtdiQZtGjUEc6VQGoW7fg/s16000/20240314-203949%20el%20siguiente%20es%20el%20chequeo%20del%20QuickScan%20en%20el%20Kernel%205.10.0-28-rt-686-pae.png)

Está con las mismas configuraciones de arriba, no sé por qué dice que está configurado sin usar la SWAP en todo caso dice que está bien.

### Escaneo en Debian 12 bookworm con Kernel Real Time 6

A la fecha 23 de Mayo de 2025 en Debian 12 donde instalé el Kernel RT (mencionado arriba), cuando pongo:

```bash
uname -r
```

Me da:

```bash
6.1.0-35-rt-amd64
```

Me falta:

"kernel support for tickless timer"

![tickless timer](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjHK2OQnh1m4g2-WHJ_t66M-lVqt4hRvPe6bk2JugvSJeB2QFlMBhetOQs5e24Lr5RfbeMftsRCCOtkU-kZ18gw62jkuXjZ7Ato6FBf-mjUHZBNu3_qoZlATgzvzoVM0VZBHa41dGBYQaPZsHM-My10ajIsVQLvvgk1JWoopGnUv2S0fgxv-B8u1tmne_M/s16000/20250523-235942%20quickscan%20not%20good%20tickless%20timer.png)

Y eso no se puede solucionar, pues para solucionarlo hay que compilar el Kernel como les explico arriba, pero lo estoy usando así, hasta mientras tenga tiempo de compilar uno.

## Configurar QjackCtl para que cargue los módulos de Pulseaudio Jack con pajackonnect

[AV Linux](http://www.bandshed.net/) usa un script para ejecutar Jack juntamente con Pulseaudio en QjackCtl, aquí les muestro una captura de pantalla que hice en AV Linux la versión AVL-MXE de 32 bits del 2021:

**QjackCtl / Setup / Options**

![pajackconnect](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgAJMqg011R3GJKDKHP11ShgjvuOIXqinExHyPFmI9phlm_GdOcAivcntYNeKWiGpTepszQ1qgT3djzOyueoCzHu2bCkEGruDjqa8hj_9rRuNbNQAxLBalhOR578FHVKM_UTjuMM3HFXQo/s16000/pajackconnect+c%25C3%25B2mo+est%25C3%25A0+conectado+con+qjackctl.png)

Donde están las siguientes instrucciones a ejecutar:

```bash
/usr/bin/pajackconnect start && a2jmidid -e &
/usr/bin/pajackconnect stop &
/usr/bin/pajackconnect reset &
```

Esto quiere decir que el ejecutable está en:

```bash
usr/bin/pajackconnect
```

![pajackconnect](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj8ZX4Fj986AzMCz4Nsr50-JuKGh38dwK9s6O5Jl5vRkmOK2MZ08CUpRq1jGHEFHZOuGRpM2QacgZ3e2UO-4MId6FiYOFZTfuEzITXqFiFg7R3b_jCN70Sv6EXR04HMaccRRzXLUsmH3MA/s16000/pajackconnect+en+usr-bin+en+AVL-MXE.png)

Este script lo creó originalmente [Lawrence D'Oliveiro](https://github.com/ldo/pajackconnect) y continúa su desarrollo [Hermann (brummer10)](https://github.com/brummer10/pajackconnect).

### Dependencias de pajackconnect

Es necesario tener instalado lo siguiente (lo pongo aunque ya lo habíamos instalado arriba para que sepan que hace este paquete):

```bash
sudo apt install a2jmidid
```

### Instalando el script pajackconnect

Para instalar en su ordenador el script, le recomiendo que abra una terminal dentro de alguna carpeta en su HOME en la que tenga una carpeta para poder instaladores o aplicaciones de Linux, y ponga de una sola vez en la terminal las cuatro líneas siguientes:

```bash
wget https://github.com/brummer10/pajackconnect/archive/refs/tags/v1.0.tar.gz
tar xf v1.0.tar.gz
cd pajackconnect-1.0
sudo cp pajackconnect /usr/bin
```

Ponga su password y se instalará pajaconnect en /usr/bin.

Puede cerrar la terminal si lo desea, o poner cd .. para ir al directorio anterior o cd para ir al principio al inicio a HOME.

También puede borrar esa carpeta pues ya no la necesitamos.

**Nota:** Instalo esa versión del 2022 [https://github.com/brummer10/pajackconnect/releases/tag/v1.0](https://github.com/brummer10/pajackconnect/releases/tag/v1.0) porque es la que más se acerca a la fecha de liberación de MX Linux 21 [https://es.wikipedia.org/wiki/MX_Linux#Lanzamientos](https://es.wikipedia.org/wiki/MX_Linux#Lanzamientos) demás de que es la única que está en Releases al menos por el momento (me imagino que esta ha de ser una liberación estable).

### Integrando el script pajackconnect a QjackCtl

Abra QjackCtl y de clic en "**Setup ..**":

![Setup](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEijYfyzYRctozTwIa15YXe_2LoVaanJvOQecoxpwTai2E74gVXUguEGKH-_D93tkh3f6KWkat1Ht33b7fMFioN9jZ3TUAkJOb2razEx1ojLGJpQMXbf9iHfwETt0MmPfFdpV0Ok0Or8i5A/s16000/20211001-091025.png)

De clic en:

**Opciones**

Y marque las siguientes tres casillas:

![Opciones](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgNvSTS696SCaBmVzgv67mlMpa-fP3OpkrJkJXNZmv49k3m06MkP71tB2uh_V3ILtyB8YxRKvaNCCiMQdg3guDlqpylmjb2KzdiCVB-tMO8GV2UqUjWew9-HNn0-8Is-JsM8s1ikwx9_sw/s16000/20211001-091234.png)

Y allí añada en cada una de ellas las siguientes tres líneas:

```bash
/usr/bin/pajackconnect start && a2jmidid -e &
/usr/bin/pajackconnect stop &
/usr/bin/pajackconnect reset &
```

Debe quedarle así:

![Configuración final](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEik7VDLHk094hWODkPniNnlDm00BhpNt5sHN_K8SfXI1U1d5Kj0wIt_zDVdDvqY-j93YoLIZTI3PouLSnS4EWUInLcY6XojViFDFrGAw8G1MeWXxThsm6dexCByUUySiQF3CXwuU5esuFY/s16000/20211001-091451.png)

Y cierre.

Ahora sí ya lo tenemos instalado y configurado.

### Configurando MIDI en QjackCtl

En QjackCtl clic en Setup:

![Setup](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhaHCd5D5-dWvyI7rT8t_DoxRJQ-Lz7k7lh-rXXkHfFrk-kXF7XQnI5RGpq0VxGiXK1paENlUNyfgOPnBmFaKuJqdb1mdvpp9wJ3vrdrocokSHtTd0GXKu-VyZi6bMUKkmUS7GNO6rZ8cfcDastP-BnBMlfuGmZ2QeGDTomqSak2l1MBEy7AXXb0xV55I0/s16000/20240524-174022%20setup.webp)

En seq:

![seq](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjtWMEcBNEUNPmSga5vJRa7NdPy-jkE8OYm8AJ1PgDl02XYU3Sg6uz0fNB1TNDYcVBE8ZV-zBUu75UEf_P_Em9y2p8OF_4sjp3o2mUwQBkUFLkFKPBJvabW_11C8EfZwK0jaGoNT6c1y3iIYT1-whxOLZA4ez_qmCagEOm2csQpMUnD98EmeLjuJ0Pn5Zw/s16000/20240524-174322poner%203%20y%20poner%20seq.webp)

Por cierto se fijará que en la latencia dice:

```bash
n/d
```

![latencia no definida](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEijQMPBqz0R0PULFVlxp7BILMeKwBYJRCBim-UZivvKyUWCbzzUFkTw3YMgae718EJarx1VAT34GPzrhXqlm-_yyn5J4-JtVtDeB6DpEY6bw8H7jjeg2zyifgqjE2vBA02PR0J-dvQ2a1zBsAFK5RS4MMc7RDjLK1w9KY5Ez_TBr880CZKXDMKznQ-3g0M/s16000/20240524-174602%20latencia%20no%20definida.webp)

O sea no definido, para que nos muestre la latencia a la que estamos debemos escoger los valores de:

- Frecuencia de muestreo: 48000
- Cuadros / Periodo: 1024

Que son los valores de AV Linux 2021.

![Configuración AV Linux](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg8rzNl1RxLuIvHHDiSi39QvXcOLTe9uQ8PQUUY5Z2mGhO5iMAJSqd_PuVbU_svQ1M4ZkUgelWRiVZFa-aq0LWh3KG_Sc6X7KkvY22BRQeKmEI0nRfZ0jBz32y-BI_hO5FpZ7vw_dghEfi3qrS8K6chGA-BOWTov5_DhcG0_YfENubaReK-JmlKXe7tdDQ/s16000/20240524-174839%20puesta%20la%20configuraci%C3%B3n%20por%20defecto%20de%20AV%20Linux%202021.webp)

Me da de latencia 64 mili segundos, o sea ese es el retardo. Dar clic en **Aceptar** y **Aplicar**.

### Sobre la Frecuencia de muestreo

En la Frecuencia de muestreo le puse 48000, pero si usted en su sistema usa audios a 44100 póngale mejor a esa frecuencia para que los programas ejemplo Ardour no tengan que convertir de una frecuencia a otra pues eso lleva tiempo, para ver qué frecuencia de muestreo tiene su audio dele clic derecho y ábralo con Mediainfo:

![Mediainfo](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirJX3qVNNGiPpIC4Sg9BfYJ6g5qrOWWaw0vUnen5GYvFFMof4p4otu6erFwXQoUl9JAYxjLkCG_yOV_z1Issl1D1Y88nxm_LnfneJwaU2-K4Af3f8VpU_KiZiLQEtZ5BZ3ddOzt7kiW6QK44g-qY84Qv96vvT3lrXtEkzIwD2Avpcct_ykQfojXhum0do/s16000/20240706-191243%20abreindo%20un%20audio%20con%20Mediainfo.png)

Y verá:

![Frecuencia de muestreo](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiZ6CLC0pDlKbsfAhdenimSgh-Co-OsGzMOXv8U9r4IIrFjP3eBRlgIwx0153UtQTTingQwkmhE0e2m6NKm8o9nUqxKRp5GO_kdV4LyoDvF04BtB3P