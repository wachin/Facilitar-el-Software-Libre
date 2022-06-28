Entro al Sistema Operativo con el Kernel de MX Linux 21


Dependencias

Debemos instalar las siguientes dependencias para poder compilarlo:

sudo apt-get install libncurses5-dev fakeroot wget xz-utils flex bison libssl-dev


Longterm release kernels
https://www.kernel.org/category/releases.html

Version 	Maintainer 	                 Released 	Projected EOL
5.15 	Greg Kroah-Hartman & Sasha Levin 	2021-10-31 	Oct, 2023
5.10 	Greg Kroah-Hartman & Sasha Levin 	2020-12-13 	Dec, 2026
5.4 	Greg Kroah-Hartman & Sasha Levin 	2019-11-24 	Dec, 2025
4.19 	Greg Kroah-Hartman & Sasha Levin 	2018-10-22 	Dec, 2024
4.14 	Greg Kroah-Hartman & Sasha Levin 	2017-11-12 	Jan, 2024
4.9 	Greg Kroah-Hartman & Sasha Levin 	2016-12-11 	Jan, 2023


Siguiendo las instrucciones de:

System configuration [Linux-Sound]
https://wiki.linuxaudio.org/wiki/system_configuration#do_i_really_need_a_real-time_kernel

Me voy a descargar el siguiente Kernel:


PARCHE

patch-5.9.1-rt20.patch.xz                          28-Oct-2020 20:05    159K

https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/
https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.9/
https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.9/patch-5.9.1-rt20.patch.xz

y el parque Real Time para esa versión:


KERNEL

linux-5.9.1.tar.xz                                 17-Oct-2020 06:38    110M

https://mirrors.edge.kernel.org/pub/linux/kernel/
https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/
https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.9.1.tar.xz


DESCARGAR CON WGET 

wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.9/patch-5.9.1-rt20.patch.xz
wget -c https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.9.1.tar.xz


INSTALACIÓN

tar xJvf linux-5.9.1.tar.xz
cd linux-5.9.1
xzcat ../patch-5.9.1-rt20.patch.xz | patch -p1
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










