
# GUÍA UNIVERSAL: Cómo crear un pendrive booteable desde Linux

> 💽 Válido para cualquier ISO de Linux
> 💻 Funciona en Debian, MX Linux, Ubuntu, Fedora, Arch, etc.
> ⚙️ No requiere programas gráficos, solo Terminal

---

## 🧩 1. Requisitos previos

**Necesitas:**

* Un **pendrive USB de al menos 4 GB** (mejor 8 GB o más).
* Una **imagen ISO** de la distribución Linux que quieres instalar, por ejemplo:

  * `EndeavourOS_Mercury-Neo-2025.03.19.iso`
  * `manjaro-xfce-25.0.10-251013-linux612.iso`
  * `deepin-23.iso`
* Acceso a un sistema Linux con permisos de administrador (`sudo`).

---

## ⚙️ 2. Conecta tu pendrive y localiza su nombre

Ejecuta este comando:

```bash
lsblk
```

Verás algo como:

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda      8:0    0 232.9G  0 disk 
├─sda1   8:1    0   512M  0 part /boot/efi
├─sda2   8:2    0   30G   0 part /
└─sda3   8:3    0 202.4G  0 part /home
sdb      8:16   1  57.3G  0 disk 
└─sdb1   8:17   1  57.3G  0 part /media/juan/SANDISK
```

👉 Aquí el pendrive es **`/dev/sdb`**.
Fíjate en el tamaño y el nombre de la marca para confirmarlo.

⚠️ **Importante:** no uses `/dev/sdb1` (la partición), sino `/dev/sdb` (el disco completo).

---

## 🚫 3. Desmonta el pendrive

Antes de grabar la ISO, desmonta el dispositivo (si está montado):

```bash
sudo umount /dev/sdb*
```

---

## 🧰 4. Graba la ISO en el pendrive con `dd`

Usa este comando:

```bash
sudo dd if=/ruta/a/tu.iso of=/dev/sdX bs=4M status=progress oflag=sync
```


sudo dd if=EndeavourOS_Mercury-Neo-2025.03.19.iso of=/dev/sdc bs=4M status=progress oflag=sync


Reemplaza:

* `/ruta/a/tu.iso` → la ruta del archivo ISO, por ejemplo:
  `~/Descargas/manjaro-xfce-25.0.10-251013-linux612.iso`
* `/dev/sdX` → el nombre de tu pendrive (por ejemplo `/dev/sdb`)

**Ejemplo real:**

```bash
sudo dd if=~/Descargas/EndeavourOS_Mercury-Neo-2025.03.19.iso of=/dev/sdb bs=4M status=progress oflag=sync
```

🕒 Este proceso puede tardar varios minutos.
Cuando termine, verás algo como:

```
123456789 bytes (1.2 GB, 1.1 GiB) copied, 300 s, 4.0 MB/s
```

---

## ✅ 5. Expulsa el pendrive correctamente

Cuando finalice, expulsa el dispositivo para evitar corrupción:

```bash
sudo eject /dev/sdb
```

O simplemente quítalo después de unos segundos.

---

## 💡 6. Iniciar desde el pendrive

1. Inserta el pendrive en la laptop o PC donde vas a probar Linux.
2. Enciende el equipo y presiona la tecla para elegir el dispositivo de arranque:

   * **Mac:** `Option (Alt)`
   * **Dell / HP / Lenovo:** `F12` o `Esc`
   * **Acer / ASUS:** `F8` o `F9`
3. Selecciona el pendrive (usualmente aparece como *EFI Boot*, *USB* o el nombre de la marca).
4. ¡Listo! Entrarás al modo *Live* o al instalador de la distro.

---

## 🔍 7. Verificar el contenido del pendrive (opcional)

Puedes comprobar si la grabación fue correcta con:

```bash
lsblk -f
```

Deberías ver un sistema de archivos **ISO9660** en tu pendrive, por ejemplo:

```
sdb      iso9660  ENDEAVOUROS_MERCURY  2025-03-19-10-00-00-00
```

---

## 🧠 NOTA IMPORTANTE

El método con `dd` funciona con casi todas las distribuciones modernas, pero:

| Tipo de ISO                                           | Método recomendado                              |
| ----------------------------------------------------- | ----------------------------------------------- |
| Arch, EndeavourOS, Manjaro, Debian, Ubuntu, Fedora    | ✅ `dd` funciona perfectamente                   |
| Distros con persistencia (Kali, MX, etc.)             | Usa `dd` o herramientas como `Ventoy` o `Rufus` |
| Distros que no arrancan en EFI 32 bits (Mac antiguos) | Instala **rEFInd** para poder arrancarlas       |

---

## 📄 RESUMEN

| Paso | Comando principal                                                     | Descripción                  |
| ---- | --------------------------------------------------------------------- | ---------------------------- |
| 1    | `lsblk`                                                               | Ver qué disco es el pendrive |
| 2    | `sudo umount /dev/sdX*`                                               | Desmontar pendrive           |
| 3    | `sudo dd if=archivo.iso of=/dev/sdX bs=4M status=progress oflag=sync` | Grabar la ISO                |
| 4    | `sudo eject /dev/sdX`                                                 | Expulsar con seguridad       |
| 5    | Reiniciar y arrancar desde USB                                        | Probar la distro             |

---
