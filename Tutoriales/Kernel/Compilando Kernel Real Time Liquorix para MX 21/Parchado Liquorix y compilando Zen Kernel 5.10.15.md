Entro al Sistema Operativo con el Kernel de MX Linux 21


Dependencias

Debemos instalar las siguientes dependencias para poder compilarlo:

sudo apt-get install libncurses5-dev fakeroot wget xz-utils flex bison libssl-dev



Primero busqué liquorix-package en:

https://github.com/damentz/liquorix-package/tags?after=5.10-24
y encontré el 
https://github.com/damentz/liquorix-package/releases/tag/5.10-15

ahora si busqué el kernel:

https://github.com/zen-kernel/zen-kernel/releases?page=31
y encontré
https://github.com/zen-kernel/zen-kernel/releases/tag/v5.10.15-zen1

Parche
https://github.com/zen-kernel/zen-kernel/releases/download/v5.10.15-zen1/v5.10.15-zen1.patch.xz
Kernel Zen
https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v5.10.15-zen1.tar.gz






Siguiendo las instrucciones de:

System configuration [Linux-Sound]
https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel

Me voy a descargar el siguiente Kernel:


DESCARGAR CON WGET 

wget -c https://github.com/zen-kernel/zen-kernel/releases/download/v5.10.15-zen1/v5.10.15-zen1.patch.xz
wget -c https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v5.10.15-zen1.tar.gz


INSTALACIÓN

    tar -xzvf v5.10.15-zen1.tar.gz
    cd zen-kernel-5.10.15-zen1
    xzcat ../v5.10.15-zen1.patch.xz | patch -p1
    
pero me dice que el parche ya ha sido aplicado

    wachin@mx21:~/Dev/Liquorix-exp1/zen-kernel-zen/zen-kernel-5.10.15-zen1
    $ xzcat ../v5.10.15-zen1.patch.xz | patch -p1
    patching file .gitignore
    Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
    
asi que lo cancelo

    
wget -c https://github.com/wachin/AV-Linux-archivos-importantes/raw/master/AVL-MXE-2021.05.22-xfce4-openbox-i386.iso/usr/src/linux-headers-5.9.1-rt19avl1/.config


El ultimo comando es para descargar el archivo de configuración para compilar el Kernel sacado de AV Linux MX Edition 2021.05.22 xfce4 openbox i386. Para verlo activamos el ver los archivos ocultos ejemplo en Thunar con Ctrl + H vemos ahora el archivo:

.config


Ahora poner allí mismo en la terminal:

    make menuconfig


verificar:

exFAT

Este Kernel si tiene soporte:

File Systems ---> DOS/FAT/exFAT/NT



```
# Enabled CCONFIG_NO_HZ_IDLE
 -> General setup
  -> Timers subsystem
   -> Timer tick handling (Full dynticks system (tickless))
    (X) Idle dynticks system (tickless idle)

# Enabled CONFIG_HIGH_RES_TIMERS
 -> General setup
  -> Timers subsystem
   [*] High Resolution Timer Support

# Enabled CONFIG_PREEMPT_RT
 -> General Setup
  -> Preemption Model (Fully Preemptible Kernel (Real-Time))
   (X) Fully Preemptible Kernel (Real-Time)

# Enabled CONFIG_HZ_1000 
 -> Processor type and features
  -> Timer frequency (1000 HZ)
   (X) 1000 HZ

# Enabled CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 ->  Power management and ACPI options
  -> CPU Frequency scaling
    -> Default CPUFreq governor
     (X) performance
```
     

 



*********************************************************


Con el .config del Kernel por defecto tiene 

schedutil

 en:

Power management and ACPI options --- 

CPU Frequency scaling ---

Default CPUFreq governor (schedutil)

el .config de AV Linux por defecto está en performance





#### Compinado el Kernel etiquetandolo  

Es  posible Compilar el Kernel y ponerle una etiqueta como descripción, en el siguiente ejemplo en LOCALVERSION= está la etiqueta  wachin:

```
make deb-pkg LOCALVERSION=-wachin KDEB_PKGVERSION=$(make kernelversion)-1
```

si se pone eso en la terminal con esa etiqueta será compilado el Kernel y eso aparecerá al final del nombre del deb

ahora pongo una imagen de lo que sale al poner el comando:

[![img](https://blogger.googleusercontent.com/img/a/AVvXsEhkv1-n-y3iXMzV7Lit9H4qcHStDQGqL_ytfSOcIJ3fhuLiRSjKj18C7VRPRi5gqKRz1nH4zP6kZAN6PlI-g1fC6U9RYZjbER9wbQ0blHDGlXDvtpTLyK4fj4dMkZuBtEvQj4gbS4O5sYnVvsEX8RcYXcfXfuj5VTJvwtU2uwb9oljyCjFsm2pH1XbU=s16000)](https://draft.blogger.com/#)

hay que esperar un buen rato hasta que termine la compilación, pueden ser horas

 . . . . . 

Bueno, ya se compiló, quizá se demoró unas 5 horas en compilar (depende del ordenador), ahora pongo una imágen de cómo me quedó

![](img/191531 Estos dos deb son el Kernel RT.png)

los dos deb:

linux-headers-5.10.109-rt65avl1-wachin_5.10.109-1_i386.deb
linux-image-5.10.109-rt65avl1-wachin_5.10.109-1_i386.deb

# Instalar el Kernel RT

Esos dos archivos deb son el Kernel, póngalos en una carpeta aparte e instalelos, abra una terminal allí y ponga:

`sudo dpkg -i *.deb`

y si desea los puede compartir en la Web

Si desea puede abrir Synaptic y buscar las palabras:

kernel image

o:

kernel header

y verá su nombre, su correo, y la etiqueta:

![](img/191532 Kernel con la etiqueta wachin.png)







make deb-pkg LOCALVERSION=-wachin KDEB_PKGVERSION=$(make kernelversion)-1



salir



**BASADO EN:**

**Building realtime Linux for ROS 2 [community-contributed] — ROS 2 Documentation: Foxy documentation**
[https://docs.ros.org/en/foxy/Tutorials/Building-Realtime-rt_preempt-kernel-for-ROS-2.html](https://docs.ros.org/en/foxy/Tutorials/Building-Realtime-rt_preempt-kernel-for-ROS-2.html)

**System configuration [Linux-Sound]**
[https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel](https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel)

**Real-Time Linux | Toradex Developer Center**
[https://developer.toradex.com/linux-bsp/real-time/real-time-linux/#preempt-rt-patch-set](https://developer.toradex.com/linux-bsp/real-time/real-time-linux/#preempt-rt-patch-set)

**Guide for Debian Maintainers**
[https://www.debian.org/doc/manuals/debmake-doc/index.en.html](https://draft.blogger.com/#)
**Chapter 3. Tool Setups**
[https://www.debian.org/doc/manuals/debmake-doc/ch03.en.html#email-setup](https://draft.blogger.com/#)






Aquí hay una descripción de las dependencias

How To Build Linux Kernel {Step-By-Step} | phoenixNAP KB
https://phoenixnap.com/kb/build-linux-kernel

En el siguiente se habla acerca de verificar si está correctamente descargado el kernel con pgp:

How to compile and install Linux Kernel 5.16.9 from source code - nixCraft
https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html










