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
https://github.com/zen-kernel/zen-kernel/releases/tag/v5.10.15-lqx1

Parche
https://github.com/zen-kernel/zen-kernel/releases/download/v5.10.15-lqx1/v5.10.15-lqx1.patch.xz
Kernel Zen
https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v5.10.15-lqx1.tar.gz






Siguiendo las instrucciones de:

System configuration [Linux-Sound]
https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel

Me voy a descargar el siguiente Kernel:


DESCARGAR CON WGET 

wget -c https://github.com/zen-kernel/zen-kernel/releases/download/v5.10.15-lqx1/v5.10.15-lqx1.patch.xz
wget -c https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v5.10.15-lqx1.tar.gz


INSTALACIÓN

    tar -xzvf v5.10.15-lqx1.tar.gz

Nota: Al extraer el archivo el nombre se cambia a:

zen-kernel-5.10.15-lqx1

    cd zen-kernel-5.10.15-lqx1
    xzcat ../v5.10.15-lqx1.patch.xz | patch -p1
    
pero me dice que el parche ya ha sido aplicado

    wachin@mx21:~/Dev/Liquorix-exp1/github.com_zen-kernel_zen-kernel/5.10.15/zen-kernel-5.10.15-lqx1
    $ xzcat ../v5.10.15-lqx1.patch.xz | patch -p1
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
     
     



PONER EL TIMER A 1000 Hz
En:

Processor type and features ---> Timer Frecuency (xxx) ---

chequear la frecuencia a 1000 Hz

 



*********************************************************


Con el .config del Kernel por defecto tiene 

schedutil

 en:

Power management and ACPI options --- 

CPU Frequency scaling ---

Default CPUFreq governor (schedutil)

el .config de AV Linux por defecto está en performance








Aquí hay una descripción de las dependencias

How To Build Linux Kernel {Step-By-Step} | phoenixNAP KB
https://phoenixnap.com/kb/build-linux-kernel

En el siguiente se habla acerca de verificar si está correctamente descargado el kernel con pgp:

How to compile and install Linux Kernel 5.16.9 from source code - nixCraft
https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html










