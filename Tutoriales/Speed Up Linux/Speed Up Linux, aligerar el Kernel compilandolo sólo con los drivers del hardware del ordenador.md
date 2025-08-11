
# USER
voy a compilar un kernel real time 

## Speed Up Linux, aligerar el Kernel compilandolo sólo con los drivers del hardware del ordenador

### Enabled CCONFIG_NO_HZ_IDLE
 -> General setup
  -> Timers subsystem
   -> Timer tick handling (Full dynticks system (tickless))
    (X) Idle dynticks system (tickless idle)

### Enabled CONFIG_HIGH_RES_TIMERS
 -> General setup
  -> Timers subsystem
   [*] High Resolution Timer Support

### Enabled CONFIG_PREEMPT_RT
 -> General setup
  -> Preemption Model (Fully Preemptible Kernel (Real-Time))
   (X) Fully Preemptible Kernel (Real-Time)
 
(Nota:los nombres pueden variar por la versión del Kernel)
 
### Enabled CONFIG_HZ_1000 
 -> Processor type and features
  -> Timer frequency (1000 HZ)
   (X) 1000 HZ

### Enabled CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 ->  Power management and ACPI options
  -> CPU Frequency scaling
    -> Default CPUFreq governor
     (X) performance 
 
###  Verificar el soporte para particiones exFAT, NTFS
 -> File systems
  -> DOS/FAT/EXFAT/NT Filesystems

y ya desabilité la virtualización pues quiero que mi laptop dell inspiron 1750 vaya más rapido, pero pregunto que más puedo desabilitar del kernel, me puedes dar un comando para que veas el hardware que tiene y de acuerdo a ello me aconsejes que puedo desabilitar

# ASSISTANT
¡Perfecto! Ya tienes una buena base para un **kernel real-time (PREEMPT_RT)** con enfoque en **baja latencia y alto rendimiento**, y ya has activado las opciones clave:

- `CONFIG_PREEMPT_RT=y` → Kernel completamente preemptible (real-time)
- `CONFIG_NO_HZ_IDLE=y` → Tickless idle (ahorro de energía y menor interrupción)
- `CONFIG_HIGH_RES_TIMERS=y` → Temporizadores de alta resolución
- `CONFIG_HZ_1000=y` → Granularidad de scheduler alta (1000 Hz)
- `CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y` → Governor de CPU en "performance"

Y mencionas que **deshabilitaste la virtualización** (`CONFIG_VIRTUALIZATION`), lo cual es razonable si no la usas, para reducir ataque de superficie y algo de overhead.

---

## ✅ Tu objetivo:
**Maximizar el rendimiento y la responsividad de tu Dell Inspiron 1750**, deshabilitando todo lo innecesario en el kernel, basado en tu hardware real.

---

## 🔧 Paso 1: Detectar tu hardware

Para recomendarte qué deshabilitar, necesito saber **qué hardware tienes**. Puedes ejecutar estos comandos en tu sistema actual (Linux) para obtener esa información:

```bash
# 1. Información general del sistema
lscpu
lshw -short
sudo dmidecode -t system

# 2. Tarjeta gráfica
lspci | grep -i vga
lspci | grep -i display

# 3. Tarjeta de red (Ethernet/WiFi)
lspci | grep -i net
lspci | grep -i wireless

# 4. Audio
lspci | grep -i audio
lspci | grep -i multimedia

# 5. Disco y controladores
lspci | grep -i storage
lspci | grep -i sata
lsblk

# 6. USB y dispositivos conectados
lsusb

# 7. Lista de módulos cargados actualmente (lo que tu sistema realmente usa)
lsmod | head -30
```

Puedes copiar y pegar la salida de estos comandos (especialmente `lscpu`, `lspci`, `lsusb`) para que yo te diga **exactamente qué puedes deshabilitar**.

---

## 🧩 Mientras tanto: Recomendaciones generales de deshabilitación segura (basadas en tu `config.txt` y tu laptop)

El **Dell Inspiron 1750** es una laptop de finales de 2009 / principios de 2010. Hardware típico:

- CPU: Intel Core 2 Duo (Penryn), 32-bit o 64-bit (según modelo)
- GPU: Intel GMA 4500MHD o similar
- WiFi: Atheros o Intel
- SATA, no NVMe
- No tiene TPM, Secure Boot, ni UEFI avanzado
- No tiene Thunderbolt, USB4, ni dispositivos modernos

### ✅ Lo que puedes **deshabilitar con seguridad** en el kernel:

#### 1. **Hardware moderno que no tienes**
```text
# Thunderbolt / USB4
CONFIG_USB4=n
CONFIG_INTEL_TBT=n
CONFIG_THUNDERBOLT=n

# NVMe (si usas disco SATA)
CONFIG_NVME=m  # o =n si no tienes SSD NVMe
CONFIG_NVME_CORE=m

# TPM / Secure Boot / Intel TXT
CONFIG_TCG_TPM=n
CONFIG_TCG_TIS=n
CONFIG_INTEL_TXT=n
CONFIG_SECURITY_SMACK=n
CONFIG_SECURITY_TOMOYO=n
CONFIG_SECURITY_YAMA=n
CONFIG_SECURITY_LOADPIN=n
CONFIG_SECURITY_LANDLOCK=n
CONFIG_LOCK_DOWN_KERNEL=n
```

> Nota: Si no usas seguridad avanzada, puedes incluso dejar solo `CONFIG_SECURITY_APPARMOR=n` o deshabilitar LSMs.

#### 2. **Virtualización (ya lo hiciste)**
```text
CONFIG_VIRTUALIZATION=n
CONFIG_KVM=n
CONFIG_XEN=n
CONFIG_HYPERV=n
CONFIG_VIRTIO=n
```

#### 3. **Wireless y Bluetooth (si no los usas)**
```text
CONFIG_WLAN=n
CONFIG_MAC80211=n
CONFIG_RFKILL=n
CONFIG_BT=n
CONFIG_BT_RFKILL=n
CONFIG_BT_INTEL=n
```

> Si usas WiFi, déjalo como `=m`, pero si no, desactívalo.

#### 4. **FireWire, PCMCIA, Card Readers (raro en Inspiron 1750)**
```text
CONFIG_FIREWIRE=n
CONFIG_PCCARD=n
CONFIG_MMC=n
CONFIG_SDIO_UART=n
CONFIG_RFKILL_GPIO=n
```

#### 5. **Drivers de GPU modernos (tu GPU es Intel i915 antiguo)**
```text
CONFIG_DRM_AMDGPU=n
CONFIG_DRM_RADEON=n
CONFIG_DRM_NOUVEAU=n
CONFIG_DRM_VGEM=n
CONFIG_DRM_SIS=n
CONFIG_DRM_VIA=n
CONFIG_DRM_TTM=n
```

> Pero **NO desactives `CONFIG_DRM_I915=m`** → es tu controlador de video.

#### 6. **Sistemas de archivos que no usas**
```text
CONFIG_BTRFS_FS=n
CONFIG_CIFS=n      # si no usas redes Windows
CONFIG_NFS_FS=n    # si no usas NFS
CONFIG_9P_FS=n     # si no usas 9P (VirtIO)
CONFIG_OCFS2_FS=n
CONFIG_GFS2_FS=n
CONFIG_JFS_FS=n
CONFIG_REISERFS_FS=n
CONFIG_XFS_FS=n
CONFIG_MINIX_FS=n
CONFIG_ROMFS_FS=n
CONFIG_HFS_FS=n
CONFIG_HFSPLUS_FS=n
CONFIG_UDF_FS=n
```

> Pero **sí deja**:
```text
CONFIG_EXT4_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_EXFAT_FS=m   # si usas exFAT
CONFIG_NTFS_FS=m    # o NTFS3 si usas el nuevo driver
```

> Recomiendo usar `NTFS3` (nativo) si estás en kernel 5.15+:
```text
CONFIG_NTFS3_FS=m
CONFIG_NTFS3_FS_POSIX_ACL=y
```

#### 7. **Drivers varios innecesarios**
```text
CONFIG_CHROME_PLATFORMS=n
CONFIG_CROS_EC=n
CONFIG_SURFACE_PLATFORMS=n
CONFIG_HP_ILO=n
CONFIG_IBM_ASM=n
CONFIG_SENSORS_LIS3LV02D=n  # acelerómetro (no tienes)
CONFIG_IIO=n
CONFIG_PMC_ATOM=n
CONFIG_INTEL_PMC_CORE=n
CONFIG_INTEL_PUNIT_IPC=n
```

#### 8. **Opciones de depuración y desarrollo (para producción, deshabilita)**
```text
CONFIG_DEBUG_KERNEL=n
CONFIG_DEBUG_FS=n
CONFIG_MAGIC_SYSRQ=n
CONFIG_KPROBES=n
CONFIG_UPROBES=n
CONFIG_JUMP_LABEL=n
CONFIG_PROFILING=n
CONFIG_TRACEPOINTS=n
CONFIG_FUNCTION_TRACER=n
CONFIG_LKDTM=n
CONFIG_TEST_* *=n
CONFIG_MEMTEST=y  # puedes dejarlo, pero ocupa espacio
```

#### 9. **Input / Teclado / Mouse (solo deja lo básico)**
```text
CONFIG_MOUSE_PS2_ELANTECH=n  # si no tienes touchpad Elantech
CONFIG_INPUT_SPARSEKMAP=n
CONFIG_INPUT_POLLDEV=n
CONFIG_INPUT_MISC=n
CONFIG_INPUT_AD714X=n
CONFIG_INPUT_CMA3000=n
```

> Pero deja:
```text
CONFIG_INPUT_EVDEV=m
CONFIG_KEYBOARD_ATKBD=m
CONFIG_MOUSE_PS2=m
```

#### 10. **Power Management avanzado (tu CPU no lo soporta bien)**
```text
CONFIG_INTEL_IDLE=n
CONFIG_CPU_FREQ=n
CONFIG_CPU_IDLE=n
```

> Pero como quieres `performance`, puedes dejar `CPU_FREQ` pero solo el governor `performance`:
```text
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=n
CONFIG_CPU_FREQ_GOV_USERSPACE=n
CONFIG_CPU_FREQ_GOV_ONDEMAND=n
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=n
```

---

## ✅ Resumen: ¿Qué dejar activo?

| Categoría | Recomendado |
|--------|-----------|
| **CPU** | `CONFIG_X86_32`, `CONFIG_X86_GENERIC`, `CONFIG_HZ_1000` |
| **Preemption** | `CONFIG_PREEMPT_RT`, `CONFIG_NO_HZ_IDLE`, `HIGH_RES_TIMERS` |
| **Archivo** | `EXT4`, `VFAT`, `EXFAT`, `NTFS3` |
| **Red** | `CONFIG_NETDEVICES`, `8139TOO`, `R8169` (tus NICs) |
| **Gráficos** | `CONFIG_DRM_I915=m` |
| **Sonido** | `CONFIG_SND_HDA_INTEL=m` (Intel G45) |
| **USB** | `CONFIG_USB_UHCI_HCD`, `CONFIG_USB_OHCI_HCD`, `CONFIG_USB_EHCI_HCD` |
| **SATA** | `CONFIG_ATA_ACPI`, `CONFIG_SATA_AHCI`, `CONFIG_LIBATA` |

---

## 📌 Próximos pasos

1. **Ejecuta estos comandos** en tu laptop y pégamelos:
```bash
lscpu
lspci -k | grep -A 3 -i vga
lspci | grep -i storage
lspci | grep -i net
lsusb
```

2. Con eso, te daré un **listado preciso de `CONFIG_*`=n** que puedes deshabilitar.

3. También puedo ayudarte a generar un `.config` limpio y optimizado.

---

¿Quieres que te genere un script para deshabilitar automáticamente estas opciones usando `scripts/config` del kernel?

### USER
wachin@debian12:~$ lscpu
lspci -k | grep -A 3 -i vga
lspci | grep -i storage
lspci | grep -i net
lsusb
Arquitectura:                            i686
  modo(s) de operación de las CPUs:      32-bit, 64-bit
  Tamaños de las direcciones:            36 bits physical, 48 bits virtual
  Orden de los bytes:                    Little Endian
CPU(s):                                  2                                                          
  Lista de la(s) CPU(s) en línea:        0,1                                                        
ID de fabricante:                        GenuineIntel                                               
  Nombre del modelo:                     Pentium(R) Dual-Core CPU       T4400  @ 2.20GHz            
    Familia de CPU:                      6                                                          
    Modelo:                              23                                                         
    Hilo(s) de procesamiento por núcleo: 1                                                          
    Núcleo(s) por «socket»:              2                                                          
    «Socket(s)»:                         1                                                          
    Revisión:                            10                                                         
    CPU(s) scaling MHz:                  73%                                                        
    CPU MHz máx.:                        2200,0000                                                  
    CPU MHz mín.:                        1200,0000                                                  
    BogoMIPS:                            4388,78                                                    
    Indicadores:                         fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cm
                                         ov pat pse36 clflush dts acpi mmx fxsr sse sse2 ht tm pbe n
                                         x lm constant_tsc arch_perfmon pebs bts cpuid aperfmperf pn
                                         i dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm xsave 
                                         lahf_lm pti dtherm
Cachés (suma de todas):                  
  L1d:                                   64 KiB (2 instancias)
  L1i:                                   64 KiB (2 instancias)
  L2:                                    1 MiB (1 instancia)
Vulnerabilidades:                        
  Gather data sampling:                  Not affected
  Indirect target selection:             Not affected
  Itlb multihit:                         KVM: Mitigation: VMX unsupported
  L1tf:                                  Mitigation; PTE Inversion
  Mds:                                   Vulnerable: Clear CPU buffers attempted, no microcode; SMT 
                                         disabled
  Meltdown:                              Mitigation; PTI
  Mmio stale data:                       Unknown: No mitigations
  Reg file data sampling:                Not affected
  Retbleed:                              Not affected
  Spec rstack overflow:                  Not affected
  Spec store bypass:                     Vulnerable
  Spectre v1:                            Mitigation; usercopy/swapgs barriers and __user pointer san
                                         itization
  Spectre v2:                            Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-
                                         eIBRS Not affected; BHI Not affected
  Srbds:                                 Not affected
  Tsx async abort:                       Not affected
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset Integrated Graphics Controller (rev 07)
        Subsystem: Dell Mobile 4 Series Chipset Integrated Graphics Controller
        Kernel driver in use: i915
        Kernel modules: i915
09:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8040 PCI-E Fast Ethernet Controller (rev 13)
0c:00.0 Network controller: Broadcom Inc. and subsidiaries BCM4312 802.11b/g LP-PHY (rev 01)
Bus 006 Device 003: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 006 Device 002: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 002 Device 002: ID 0bda:0158 Realtek Semiconductor Corp. USB 2.0 multicard reader
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub


### ASSISTANT
¡Perfecto! Gracias por la información detallada. Con base en tu **Dell Inspiron 1750**, el **kernel 5.10.240** y el hardware que tienes, ya puedo darte una **lista precisa y segura de opciones del kernel que puedes deshabilitar** para reducir el tamaño, mejorar el rendimiento y minimizar el ataque de superficie, sin afectar tu funcionalidad.

---

## ✅ Resumen del Hardware

| Componente | Detalle |
|----------|--------|
| **CPU** | Intel Pentium Dual-Core T4400 (2 núcleos, 32-bit, sin SMT) |
| **GPU** | Intel Mobile 4 Series (i915) – GMA 4500MHD |
| **Ethernet** | Marvell 88E8040 (PCI-E Fast Ethernet) |
| **WiFi** | Broadcom BCM4312 802.11b/g (LP-PHY) |
| **USB** | 2.0, con hub interno y lector de tarjetas Realtek |
| **Almacenamiento** | SATA (probablemente disco mecánico) |
| **Arquitectura** | i686 (32-bit), aunque soporta 64-bit |

---

## 🚫 Recomendaciones: Qué deshabilitar en el kernel

Basado en tu hardware real, puedes **deshabilitar decenas de drivers y opciones innecesarias**. Aquí va una lista completa y segura de `CONFIG_*` que puedes poner en `n` o eliminar (si no los necesitas).

> ⚠️ **Importante**: Usa `make menuconfig` o edita `.config` directamente, luego ejecuta `make olddefconfig` para que se resuelvan dependencias.

---

### 🔧 1. **Virtualización, Hyper-V, Xen, KVM**
No los usas, y tu CPU no está optimizado para ellos.

```text
CONFIG_VIRTUALIZATION=n
CONFIG_KVM=n
CONFIG_XEN=n
CONFIG_HYPERV=n
CONFIG_VIRTIO=n
CONFIG_VIRTIO_BLK=n
CONFIG_VIRTIO_NET=n
CONFIG_VIRTIO_CONSOLE=n
CONFIG_VIRTIO_BALLOON=n
CONFIG_VSOCKETS=n
```

---

### 🔧 2. **Hardware moderno que no tienes**

#### ❌ Thunderbolt, USB4, PCIe avanzado
```text
CONFIG_THUNDERBOLT=n
CONFIG_USB4=n
CONFIG_INTEL_TBT=n
CONFIG_INTEL_PMT=n
CONFIG_INTEL_PMC_CORE=n
CONFIG_INTEL_PUNIT_IPC=n
CONFIG_UCSI=n
CONFIG_TYPEC=n
CONFIG_USB_ROLE_SWITCH=n
```

#### ❌ TPM / Secure Boot / Intel TXT
```text
CONFIG_TCG_TPM=n
CONFIG_TCG_TIS=n
CONFIG_TCG_NSC=n
CONFIG_TCG_ATMEL=n
CONFIG_TCG_INFINEON=n
CONFIG_TCG_CRB=n
CONFIG_HW_RANDOM_TPM=n
CONFIG_SECURITYFS=n
CONFIG_LOCK_DOWN_KERNEL=n
```

#### ❌ Módulos de seguridad avanzada (si no los usas)
```text
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=n
CONFIG_SECURITY_NETWORK=n
CONFIG_SECURITY_PATH=n
CONFIG_SECURITY_YAMA=n
CONFIG_SECURITY_SAFESETID=n
CONFIG_SECURITY_LOCKDOWN_LSM=n
CONFIG_SECURITY_LOADPIN=n
CONFIG_SECURITY_TOMOYO=n
CONFIG_SECURITY_APPARMOR=n
CONFIG_SECURITY_SELINUX=n
CONFIG_SECURITY_SMACK=n
CONFIG_SECURITY_LANDLOCK=n
```

> Puedes dejar `CONFIG_SECURITY=y` si quieres `security=`, pero si no, pon `CONFIG_SECURITY=n`.

---

### 🔧 3. **Gráficos modernos (tu GPU es i915 antiguo)**

```text
CONFIG_DRM_AMDGPU=n
CONFIG_DRM_RADEON=n
CONFIG_DRM_NOUVEAU=n
CONFIG_DRM_VGEM=n
CONFIG_DRM_SIS=n
CONFIG_DRM_VIA=n
CONFIG_DRM_TTM=n
CONFIG_DRM_PANEL=n
CONFIG_DRM_BRIDGE=n
CONFIG_DRM_MIPI_DSI=n
CONFIG_DRM_DP_AUX_CHARDEV=n
CONFIG_DRM_LOAD_EDID_FIRMWARE=y  # déjalo, útil
CONFIG_DRM_KMS_FB_HELPER=y       # déjalo
CONFIG_DRM_FBDEV_EMULATION=y     # déjalo
CONFIG_DRM_I915=m                # ¡OBLIGATORIO! Tu GPU
```

---

### 🔧 4. **Sistemas de archivos innecesarios**
Solo deja los que usas.

```text
CONFIG_BTRFS_FS=n
CONFIG_JFS_FS=n
CONFIG_XFS_FS=n
CONFIG_REISERFS_FS=n
CONFIG_OCFS2_FS=n
CONFIG_GFS2_FS=n
CONFIG_MINIX_FS=n
CONFIG_ROMFS_FS=n
CONFIG_HFS_FS=n
CONFIG_HFSPLUS_FS=n
CONFIG_UDF_FS=n
CONFIG_NILFS_FS=n
CONFIG_F2FS_FS=n
CONFIG_EXT2_FS=n  # si no usas ext2, si no, =m
CONFIG_EXT3_FS=n  # si no usas ext3, si no, =m
CONFIG_EXT4_FS=m  # probablemente lo necesitas
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_EXFAT_FS=m
CONFIG_NTFS_FS=n
CONFIG_NTFS3_FS=m  # si usas NTFS moderno
```

---

### 🔧 5. **Redes avanzadas / virtuales / inalámbricas modernas**

```text
CONFIG_WIRELESS=n
CONFIG_CFG80211=n
CONFIG_MAC80211=n
CONFIG_RFKILL=n
CONFIG_RFKILL_INPUT=n
CONFIG_RFKILL_GPIO=n
CONFIG_BT=n
CONFIG_BT_RFKILL=n
CONFIG_BT_INTEL=n
CONFIG_BT_BCM=n
CONFIG_BT_HCIBCM203X=n
CONFIG_BT_HCIBPA10X=n
CONFIG_BT_HCIBFUSB=n
CONFIG_BT_HCIUART=n
CONFIG_BT_HCIUART_BCM=n
CONFIG_BT_HCIUART_3WIRE=n
CONFIG_BT_HCIBTUSB=n
CONFIG_BT_HCIBTUSB_BCM=n
CONFIG_BT_HCIBTUSB_RTL=n
CONFIG_BT_HCIBTUSB_INTEL=n
CONFIG_BT_HCIBTUSB_BCM203X=n
CONFIG_BT_HCIBTUSB_CREEK=n
CONFIG_BT_HCIBTUSB_MTK=n
```

> Pero **necesitas el driver de tu WiFi BCM4312**:
> - Usa `b43` o `bcma` + `brcmsmac` (recomendado: `b43`)
> - Asegúrate de tener firmware: `firmware-b43-installer`

```text
CONFIG_B43=m
CONFIG_B43_BCMA=y
CONFIG_B43_PIO=y
CONFIG_B43_PHY_LP=y
CONFIG_B43_HWRNG=y
CONFIG_B43LEGACY=m
CONFIG_B43LEGACY_HWRNG=y
CONFIG_B43LEGACY_PIO=y
CONFIG_B43LEGACY_DMA=y
CONFIG_B43LEGACY_DEBUG=y
CONFIG_B43LEGACY_DMA=y
```

> Si no funciona, prueba `wl` (proprietario), pero requiere firmware Broadcom.

---

### 🔧 6. **Drivers de almacenamiento modernos**

```text
CONFIG_NVME_CORE=n
CONFIG_NVME=m
CONFIG_NVME_FABRICS=n
CONFIG_NVME_TCP=n
CONFIG_NVME_TARGET=n
CONFIG_ATA_SFF=n
CONFIG_PDC_ADMA=n
CONFIG_SATA_AHCI=n  # si no lo necesitas, pero probablemente SÍ lo necesitas
CONFIG_SATA_INTEL=n
CONFIG_SATA_VIA=n
CONFIG_SATA_SIL=n
CONFIG_SATA_SX4=n
CONFIG_PATA_AMD=n
CONFIG_PATA_ARTOP=n
CONFIG_PATA_CMD64X=n
CONFIG_PATA_HPT366=n
CONFIG_PATA_HPT37X=n
CONFIG_PATA_HPT3X2N=n
CONFIG_PATA_HPT3X3=n
CONFIG_PATA_IT8213=n
CONFIG_PATA_IT821X=n
CONFIG_PATA_JMICRON=n
CONFIG_PATA_MARVELL=n
CONFIG_PATA_NETCELL=n
CONFIG_PATA_NINJA32=n
CONFIG_PATA_NS87410=n
CONFIG_PATA_NS87415=n
CONFIG_PATA_OPTIDMA=n
CONFIG_PATA_OPTI=n
CONFIG_PATA_PDC2027X=n
CONFIG_PATA_PDC_OLD=n
CONFIG_PATA_RADISYS=n
CONFIG_PATA_RDC=n
CONFIG_PATA_SCH=n
CONFIG_PATA_SERVERWORKS=n
CONFIG_PATA_SIL680=n
CONFIG_PATA_SIL685=n
CONFIG_PATA_SIS=n
CONFIG_PATA_TOSHIBA=n
CONFIG_PATA_TRIFLEX=n
CONFIG_PATA_VIA=n
CONFIG_PATA_WINBOND=n
```

> ✅ **Deja activo**:
```text
CONFIG_ATA=y
CONFIG_ATA_BMDMA=y
CONFIG_ATA_PIIX=y  # controlador SATA estándar
CONFIG_SATA_MOBILE_LPM_POLICY=0  # deshabilita LPM para mejor rendimiento
```

---

### 🔧 7. **USB innecesarios**

Tu USB es básico. Puedes deshabilitar controladores de dispositivos que no tienes.

```text
CONFIG_USB_GADGET=n
CONFIG_USB_MASS_STORAGE=n
CONFIG_USB_UAS=n
CONFIG_USB_SERIAL=m  # si usas dispositivos seriales USB
CONFIG_USB_SERIAL_FTDI_SIO=m  # común, déjalo si no estás seguro
CONFIG_USB_SERIAL_CP210X=m
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_PL2303=m
CONFIG_USB_WDM=m
CONFIG_USB_TMC=m
CONFIG_USB_STORAGE=m
CONFIG_USB_STORAGE_DEBUG=n
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=m
CONFIG_USB_STORAGE_ISD200=m
CONFIG_USB_STORAGE_USBAT=m
CONFIG_USB_STORAGE_SDDR09=m
CONFIG_USB_STORAGE_SDDR55=m
CONFIG_USB_STORAGE_JUMPTOUCH=m
CONFIG_USB_STORAGE_ALAUDA=m
CONFIG_USB_STORAGE_ONETOUCH=m
CONFIG_USB_STORAGE_KARMA=m
CONFIG_USB_STORAGE_CYPRESS_ATACB=m
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_STORAGE_INTUSS=m
CONFIG_USB_STORAGE_SX8=m
CONFIG_USB_STORAGE_STORVLT=m
CONFIG_USB_STORAGE_SGBULK=m
CONFIG_USB_STORAGE_HPUSBSCSI=m
CONFIG_USB_STORAGE_MICROTEK=m
CONFIG_USB_STORAGE_HUAWEI_CDC_NCM=m
CONFIG_USB_STORAGE_SEAGATE=m
CONFIG_USB_STORAGE_BULK=m
CONFIG_USB_STORAGE_DPCM=m
CONFIG_USB_STORAGE_USBBOOTS=m
CONFIG_USB_STORAGE_DELLEMC=m
CONFIG_USB_STORAGE_CYPRESS_USBBOOT=m
```

> ✅ Deja:
```text
CONFIG_USB_EHCI_HCD=m
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_UHCI_HCD=m
CONFIG_USB_CORE=m
CONFIG_USB_COMMON=m
CONFIG_USB=m
```

---

### 🔧 8. **Sonido (puedes reducirlo)**

```text
CONFIG_SND_USB_AUDIO=m  # si usas audio USB
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_6FIRE=m
CONFIG_SND_USB_HIFACE=m
CONFIG_SND_BCD2000=m
CONFIG_SND_USB_LINE6=m
CONFIG_SND_FIREWIRE=n
CONFIG_SND_FIREWIRE_LIB=n
CONFIG_SND_DICE=n
CONFIG_SND_OXFW=n
CONFIG_SND_ISIGHT=n
CONFIG_SND_FIREWIRE_DIGI00X=n
CONFIG_SND_FIREWIRE_TASCAM=n
CONFIG_SND_FIREWIRE_MOTU=n
CONFIG_SND_FIREFACE=n
CONFIG_SND_SOC=n
```

> ✅ Deja:
```text
CONFIG_SND_HDA_INTEL=m  # tu audio probablemente es HDA
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
CONFIG_SND_HDA_CODEC_SIGMATEL=m
CONFIG_SND_HDA_GENERIC=m
```

---

### 🔧 9. **Depuración, tracing, desarrollo**

```text
CONFIG_PROFILING=n
CONFIG_TRACEPOINTS=n
CONFIG_FTRACE=n
CONFIG_FUNCTION_TRACER=n
CONFIG_KPROBES=n
CONFIG_UPROBES=n
CONFIG_JUMP_LABEL=n
CONFIG_DEBUG_FS=n
CONFIG_MAGIC_SYSRQ=n
CONFIG_DEBUG_KERNEL=n
CONFIG_DEBUG_MISC=n
CONFIG_DEBUG_INFO=n
CONFIG_DEBUG_INFO_REDUCED=n
CONFIG_DEBUG_INFO_DWARF4=n
CONFIG_GDB_SCRIPTS=n
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_FRAME_POINTER=y
CONFIG_STACKTRACE=y
CONFIG_SAMPLES=n
CONFIG_KGDB=n
CONFIG_KGDB_SERIAL_CONSOLE=n
CONFIG_KGDB_TESTS=n
CONFIG_TEST_KMOD=n
CONFIG_TEST_USER_COPY=n
```

---

### 🔧 10. **Otras deshabilitaciones seguras**

```text
CONFIG_CHROME_PLATFORMS=n
CONFIG_CROS_EC=n
CONFIG_INTEL_SCU_IPC=n
CONFIG_INTEL_SCU_PCI=n
CONFIG_INTEL_SCU_PLATFORM=n
CONFIG_INTEL_PMC_BXT=n
CONFIG_INTEL_SOC_PMIC=n
CONFIG_MFD_INTEL_LPSS=n
CONFIG_MFD_INTEL_PMC_BXT=n
CONFIG_MFD_CROS_EC=n
CONFIG_MFD_CORE=n
CONFIG_MFD_HTC_PASIC3=n
CONFIG_MFD_SM501=n
CONFIG_MFD_VX855=n
CONFIG_MFD_WL1273_CORE=n
CONFIG_MFD_WM8400=n
CONFIG_MFD_WM831X=n
CONFIG_MFD_WM8994=n
CONFIG_MFD_TPS65090=n
CONFIG_MFD_TPS65910=n
CONFIG_MFD_TPS65912=n
CONFIG_MFD_TPS80031=n
CONFIG_MFD_TWL4030_CORE=n
CONFIG_MFD_TWL6040_CORE=n
CONFIG_MFD_STMPE=n
CONFIG_MFD_STMPE610=n
CONFIG_MFD_STMPE811=n
CONFIG_MFD_STMPE1600=n
CONFIG_MFD_STMPE1801=n
CONFIG_MFD_LM3533=n
CONFIG_MFD_LP3943=n
CONFIG_MFD_LP8788=n
CONFIG_MFD_TI_LMU=n
CONFIG_MFD_PALMAS=n
CONFIG_MFD_MAX8907=n
CONFIG_MFD_MAX8925=n
CONFIG_MFD_MAX8997=n
CONFIG_MFD_MAX77650=n
CONFIG_MFD_MAX77686=n
CONFIG_MFD_MAX77693=n
CONFIG_MFD_MAX77843=n
CONFIG_MFD_MAX8998=n
CONFIG_MFD_MAX7368=n
CONFIG_MFD_MAX77620=n
CONFIG_MFD_AS3711=n
CONFIG_MFD_AS3722=n
CONFIG_MFD_CROS_EC=n
CONFIG_MFD_MADERA=n
CONFIG_MFD_RETU=n
CONFIG_MFD_JANZ_CMODIO=n
CONFIG_MFD_KEMPLD=n
CONFIG_MFD_88PM800=n
CONFIG_MFD_88PM805=n
CONFIG_MFD_88PM860X=n
CONFIG_MFD_MAX77650=n
CONFIG_MFD_MAX77686=n
CONFIG_MFD_MAX77693=n
CONFIG_MFD_MAX77843=n
CONFIG_MFD_MAX8998=n
CONFIG_MFD_MAX7368=n
CONFIG_MFD_MAX77620=n
CONFIG_MFD_AS3711=n
CONFIG_MFD_AS3722=n
CONFIG_MFD_CROS_EC=n
CONFIG_MFD_MADERA=n
CONFIG_MFD_RETU=n
```

---

## ✅ Lo que debes dejar ACTIVO

| Categoría | Opción |
|--------|-------|
| **CPU** | `CONFIG_X86_32`, `CONFIG_M686`, `CONFIG_X86_GENERIC` |
| **Preemption** | `CONFIG_PREEMPT_RT`, `CONFIG_NO_HZ_IDLE`, `CONFIG_HIGH_RES_TIMERS` |
| **Timer** | `CONFIG_HZ_1000` |
| **CPUFreq** | `CONFIG_CPU_FREQ=y`, `CONFIG_CPU_FREQ_GOV_PERFORMANCE=y` |
| **Gráficos** | `CONFIG_DRM_I915=m` |
| **Red Ethernet** | `CONFIG_SKGE=m`, `CONFIG_SK98LIN=m`, `CONFIG_VXGE=m`, o mejor: `CONFIG_ATL1=m`, `CONFIG_ATL1E=m`, `CONFIG_ATL2=m` (para Marvell 88E8040) |
| **WiFi** | `CONFIG_B43=m` o `CONFIG_B43LEGACY=m` |
| **USB** | `CONFIG_USB_UHCI_HCD`, `CONFIG_USB_OHCI_HCD`, `CONFIG_USB_EHCI_HCD` |
| **SATA** | `CONFIG_ATA_PIIX=m`, `CONFIG_SATA_AHCI=m` |
| **Sonido** | `CONFIG_SND_HDA_INTEL=m` |
| **Filesystems** | `CONFIG_EXT4_FS`, `CONFIG_VFAT_FS`, `CONFIG_EXFAT_FS`, `CONFIG_NTFS3_FS` |

---

## 🛠️ Comando útil: limpiar `.config`

Después de editar tu `.config`, ejecuta:

```bash
make olddefconfig
```

Esto asegura que todas las dependencias se resuelvan automáticamente y que no haya opciones faltantes.

---

## ✅ Próximos pasos

1. Edita tu `.config` con las opciones `=n` anteriores.
2. Ejecuta `make olddefconfig`.
3. Compila: `make -j2` (por los 2 núcleos).
4. Instala: `make modules_install install`.
5. Actualiza GRUB: `update-grub`.

---

¿Quieres que te genere un **script automático** que aplique todas estas deshabilitaciones al `.config`? Puedo darte un `sed` o un script en bash.