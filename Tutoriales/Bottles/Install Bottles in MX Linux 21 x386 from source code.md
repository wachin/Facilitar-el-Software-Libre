

# Install Bottles in MX Linux 21 x386 from source code

I follow this guide:

Installation - Bottles   
https://docs.usebottles.com/getting-started/installation

Install:

```
sudo apt install meson ninja-build appstream-util libglib2.0-dev libwebkit2gtk-4.0-dev libhandy-1-dev patool gir1.2-granite-1.0 python3 python3-gi python3-yaml python3-certifi python3-requests python3-markdown patool p7zip libhandy-1-0 zlib1g gir1.2-gtk-3.0 gir1.2-handy-1 gir1.2-notify-0.7 libglib2.0-bin ibus-gtk3 libfreetype6 gamemode gamemode-daemon libgamemode0 winbind
```

for MX Linux 21 I use follow source:

https://github.com/bottlesdevs/Bottles/releases/tag/2021.11.28-treviso

next in a terminal:

```
wget -c https://github.com/bottlesdevs/Bottles/archive/refs/tags/2021.11.28-treviso.tar.gz
tar xf 2021.11.28-treviso.tar.gz
cd Bottles-2021.11.28-treviso
mkdir build
meson build && cd build
ninja -j$(nproc)
ninja install
```

To uninstall (into the source path):

```
ninja uninstall
```


# To create the deb

Edit the file:

/Bottles-releases/Bottles-3.1.9/debian/compat

change from:

9

to:

10

# Building

in a terminal:

    dpkg-buildpackage -rfakeroot -b -uc -us
    
the deb file will be created in the above directory






 
 
 





