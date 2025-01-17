# Building Tenacity

## Prerequisites

### Linux

Most distributions do not package all of Tenacity's dependencies (yet).
wxWidgets 3.1 is suggested for building Tenacity but many distributions only
package wxWidgets 3.0. When 3.0 is used instead of 3.1, the main user visible
known drawback is that a few user interface texts will not be localized, and
the effects of not having various wxWidgets bug fixes that have not been
backported to the stable 3.0 series.


    wget -c https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.6/wxWidgets-3.1.6.tar.bz2
    
    wget -c https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.2/wxWidgets-3.1.2.tar.bz2
    
    wget -c https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.5/wxWidgets-3.1.5.tar.bz2

y según las instrucciones de:

Prerequisites       {#gtk_prereq}
file:///home/wachin/Dev/Tenacity-MX-21-build/wxWidgets/wxWidgets-3.1.6/docs/gtk/install.md

hay que instalar:

    sudo libgtk-3-dev libgl1-mesa-dev libglu1-mesa-dev libgstreamer-plugins-base1.0-dev libcurl4-openssl-dev libwebkit2gtk-4.0-dev libpng-dev libjpeg-dev libtiff-dev

If you compile wxWidgets on Linux for the first time and don't like to read
install instructions just do the following in wxWidgets directory:

    $ mkdir buildgtk
    $ cd buildgtk
    $ ../configure --with-gtk
    $ make
    $ sudo make install
    $ sudo ldconfig
    
    
*************



#### wxWidgets from source

Where wxWidgets is not provided as a binary package,
a possible way to build and install wxWidgets from source is given by the
following example. After [downloading](https://www.wxwidgets.org/downloads/) and extracting the
source code into a location, such as `~/Downloads/wxWidgets-3.1.5`, it can be built in a local
directory, such as `~/Downloads/wxWidgets-build`:

```
cd ~/Downloads
mkdir wxWidgets-build && cd wxWidgets-build  # create and go to a new empty build directory
cmake -G Ninja ~/Downloads/wxWidgets-3.1.5   # configure wxWidgets from the assumed download location
cmake --build .  # actual compilation
```

Then to install wxWidgets in the default location, run

```
sudo cmake --build . --target install
```


mkdir wxWidgets-build
cd wxWidgets-build 
cmake -G Ninja ..
cmake --build .
sudo cmake --build . --target install

********************


[PortMidi](https://github.com/mixxxdj/portmidi) 

sudo apt install libasound2-dev

git clone https://github.com/mixxxdj/portmidi
cd portmidi
mkdir build
cd build
cmake ..
make
sudo make install


and
[PortSMF](https://github.com/tenacityteam/portsmf) 
are required for MIDI support
but some distributions do not package PortSMF (Tenacity can still build without
MIDI support). 


git clone https://github.com/tenacityteam/portsmf
cd portsmf
mkdir build
cd build
cmake ..
make
sudo make install



[libsbsms](https://github.com/claytonotey/libsbsms) is an
optional dependency used for time stretching that is not available in many Linux
distribution package managers either.

git clone https://github.com/claytonotey/libsbsms
cd libsbsms
mkdir build
cd build
cmake ..
make
sudo make install



Optionally,
[vcpkg can be used](#vcpkg-on-Linux) to build dependencies from source which
may be helpful if your distribution is missing some packages.

Installing ccache and ninja-build is highly recommended for faster builds but
not required. CMake will automatically use ccache if it is installed.


#### Debian, Ubuntu, and derived distributions

To install Tenacity's dependencies, run:

**Nota:** La siguiente es una modificacion del original, cambiél el paquete: libjack-dev por libjack-jackd2-dev porque el primero me eliminaba unos paquetes de jack que no es necesario eliminar:

```
sudo apt-get install build-essential libavcodec-dev libavformat-dev libavutil-dev libflac++-dev libglib2.0-dev libgtk-3-dev libid3tag0-dev libjack-jackd2-dev liblilv-dev libmad0-dev libmp3lame-dev libogg-dev libpng-dev portaudio19-dev libportmidi-dev libserd-dev libsndfile1-dev libsord-dev libsoundtouch-dev libsoxr-dev libsuil-dev libtwolame-dev vamp-plugin-sdk libvorbis-dev lv2-dev zlib1g-dev cmake ninja-build libjpeg-dev libtiff-dev liblzma-dev libsqlite3-dev ccache libavdevice-dev nasm
```

Nota: Añado ccache, como dice arriba

##### Notes

- The version of PortSMF included in Debian & Ubuntu distributions
(`libportsmf-dev`) is not included in the above list because it is outdated
and using it will cause Tenacity to fail to build. If you want to use MIDI, it
is recommended to use our modified version of
[PortSMF](https://github.com/tenacityteam/portsmf) that you should build
from source until the packaged version gets updated. If you are installing
PortSMF to any other location than the default location where libraries get
installed (`/usr/local/lib`, `/usr/lib`, etc.) such as your `$HOME` directory,
you should point CMake to it by adding `-DCMAKE_PREFIX_PATH=/path/to/portsmf`
to the CMake configuration step.

- Additionally, if you happen to come across a package conflict involving a
package called `libjack0`, you may need to install `libjack-jack2-dev` instead
of `libjack-dev`.

- wxWidgets 3.1 is suggested but not packaged in Debian or Ubuntu. Refer
to the
[wxWidgets documentation](https://docs.wxwidgets.org/3.1/overview_cmake.html)
for how to install it from source code, or see the [previous section](#wxwidgets-from-source). The above package list
includes wxWidgets' build dependencies. If you install wxWidgets
somewhere other than the default /usr/local, you need to set the
`WX_CONFIG` environment variable to the location of the `wx-config`
script installed by wxWidgets to get CMake to find wxWidgets 3.1. For
example, if you installed wxWidgets to /home/user/local:

```
export WX_CONFIG=/home/user/local/bin/wx-config
```

- Alternatively, you may skip installing wxWidgets 3.1 and use 3.0 instead:

```
sudo apt-get install libwxgtk3.0-dev
```


#### vcpkg on Linux

Optionally, you can build dependencies from source using vcpkg, with the
exception of wxWidgets due to
[bugs in vcpkg's wxwidgets package](https://github.com/microsoft/vcpkg/pull/17111).
vcpkg is not set up to build GTK or GLib either. To use vcpkg for
dependencies, pass `-D VCPKG=ON` to the CMake configure command. You will need
[nasm](https://www.nasm.us/) installed to build ffmpeg from vcpkg which you can
install from your distribution's package manager. If you use vcpkg, you need to
set the `WX_CONFIG` environment variable to the path of the wx-config script
installed by wxWidgets. For example, if you installed wxWidgets to /usr/local:

```
export WX_CONFIG=/usr/local/bin/wx-config
```

If you switch between system packages and vcpkg, you may need to delete
`CMakeCache.txt` inside your CMake build directory.



## Building Tenacity

On Windows, run the commands below from the x64 Native Tools Command Prompt. For
other operating systems, run them from a normal shell.

First, download the Tenacity source code:

```
git clone https://github.com/tenacityteam/tenacity.git
cd tenacity
```

Then, configure CMake. This will take a long time the first time on macOS and
Windows (or if you use `-D VCPKG=ON` on Linux) because vcpkg will compile
itself, then compile Tenacity's dependencies. `-G Ninja` is recommended for
faster builds but not required. Add `-D CMAKE_INSTALL_PREFIX=/some/path` to
change the installation path from the default /usr/local:

```
cmake -G Ninja -S . -B build
```

Lo siguiente es todo lo que se ha activado:

-- Searching for dependencies from system, not using vcpkg.
-- Detected that we are using a single config generator without a build type defined...
-- To fix this we are using default value for CMAKE_BUILD_TYPE
-- The ASM_NASM compiler identification is NASM
-- Found assembler: /usr/bin/nasm
-- Inter-procedural optimization is supported
-- Using ccache for compiler caching to speed up rebuilds
CMake Warning at CMakeLists.txt:418 (message):
  Unable to optimize build CPU usage, defaulting to use all processors


-- Build Info:
--      Host System Name: Linux
--      Host System Version: 5.10.0-13-686
--      Host System Processor: i686
--      Host System Arch: 64-bit
-- 
--      Target System Name: Linux
--      Target System Version: 5.10.0-13-686
--      Target System Processor: i686
--      Target System Arch: 32-bit
-- 
--      Compiler: /usr/bin/c++
--      Compiler Version: 10.2.1
--      Compiler Standard: 17
--      Compiler Standard Required: ON
--      Compiler Extensions: 
-- 
-- 
--      Current Commit: Audacity-3.0.2-911-g91f8b43
-- 
-- MIDI support enabled.
-- ID3 tag support for MP3s enabled.
-- MP3 decoding support enabled.
-- MP2 encoding support enabled.
-- OGG container format support enabled.
-- Vorbis codec support enabled.
-- FLAC codec support enabled.
-- SBSMS timestretching support enabled.
-- SoundTouch timestretching support enabled.
-- Searching for FFMPEG components
-- /usr/lib/i386-linux-gnu/libavcodec.so
-- avcodec
--   - libavcodec 58.134.100 found.
-- /usr/lib/i386-linux-gnu/libavformat.so
-- avformat
--   - libavformat 58.76.100 found.
-- /usr/lib/i386-linux-gnu/libavdevice.so
-- avdevice
--   - libavdevice  found.
-- /usr/lib/i386-linux-gnu/libavutil.so
-- avutil
--   - libavutil 56.70.100 found.
-- /usr/lib/i386-linux-gnu/libavfilter.so
-- avfilter
--   - libavfilter  found.
-- /usr/lib/i386-linux-gnu/libswscale.so
-- swscale
--   - libswscale  found.
-- /usr/lib/i386-linux-gnu/libpostproc.so
-- postproc
--   - libpostproc  found.
-- /usr/lib/i386-linux-gnu/libswresample.so
-- swresample
--   - libswresample 3.9.100 found.
-- FFMPEG codecs support enabled.
-- VAMP plugin hosting enabled. Requires VAMP host SDK.
-- LV2 plugin hosting enabled.
-- Found wxWidgets: -L/usr/local/lib;-pthread;;;-lwx_baseu-3.1;-lwx_gtk3u_core-3.1;-lwx_gtk3u_html-3.1;-lwx_gtk3u_qa-3.1;-lwx_baseu_xml-3.1;-lwx_baseu_net-3.1 (found suitable version "3.1.6", minimum required is "3.0") 
-- Found wxWidgets: -L/usr/local/lib;-pthread;;;-lwx_gtk3u_xrc-3.1;-lwx_gtk3u_html-3.1;-lwx_gtk3u_qa-3.1;-lwx_gtk3u_core-3.1;-lwx_baseu_xml-3.1;-lwx_baseu_net-3.1;-lwx_baseu-3.1 (found version "3.1.6") 
-- ========== Configuring manual ==========
-- ========== Configuring images ==========
-- ========== Configuring lib-string-utils ==========
-- ========== Configuring lib-strings ==========
-- ========== Configuring lib-utility ==========
-- ========== Configuring locale ==========
-- ========== Configuring Tenacity ==========
-- Using precompiled headers
-- ========== Configuring mod-script-pipe ==========
-- ========== Configuring mod-null ==========
-- ========== Configuring mod-nyq-bench ==========
-- ========== Configuring nyquist ==========
-- ========== Configuring plug-ins ==========
-- ========== Configuring minsrc ==========
-- Configuring done
-- Generating done
-- Build files have been written to: /home/wachin/Dev/Tenacity-MX-21-build/tenacity/build



Build Tenacity:

```
cmake --build build --config Release
```

Run Tenacity:

```
build/bin/Release/tenacity
```

Optionally, install Tenacity:

```
cmake --install build
```

## Build options

These are set with a `-D` prefix, for example `cmake -DLV2=OFF ...`

  * **VCPKG** (ON|OFF): whether to use dependencies from vcpkg. ON by default
    for Windows and macOS; OFF by default for Linux.
  * **VCPKG_ROOT** (file path): path to vcpkg Git repository, defaults to
    using the vcpkg submodule in the Tenacity repository
  * **SCCACHE** (ON|OFF): whether to use sccache for compiler caching to
    speed up rebuilds. ON by default if sccache is installed.
  * **CCACHE** (ON|OFF): whether to use ccache for compiler caching to speed
    up rebuilds. ON by default if ccache is installed. If sccache and ccache
    are both installed, sccache will be prefered.

The following feature options are enabled by default if the required libraries
are found. You may explicitly disable them if you prefer or your distribution
has outdated libraries that do not build with Tenacity.

  * **MIDI** (ON|OFF): MIDI support. Requires PortMidi and PortSMF.
  * **ID3TAG** (ON|OFF): ID3 tag support for MP3 files. Requires libid3tag.
  * **MP3_DECODING** (ON|OFF): MP3 decoding support. Requires libmad.
  * **MP2_ENCODING** (ON|OFF): MP2 encoding support. Requires Twolame library.
  * **OGG** (ON|OFF): Ogg container format support. Requires libogg.
  * **VORBIS** (ON|OFF): Vorbis codec support. Requires libvorbis.
  * **FLAC** (ON|OFF): FLAC codec support. Requires libflac and libflac++ C++
    bindings.
  * **SBSMS** (ON|OFF): SBSMS timestretching support. Requires libsbsms.
  * **SOUNDTOUCH** (ON|OFF): SoundTouch timestretching support. Requires
    SoundTouch library.
  * **FFMPEG** (ON|OFF): Support for a wide variety of codecs with FFmpeg.
    Requires FFmpeg libraries.
  * **VAMP** (ON|OFF): VAMP plugin hosting support. Requires VAMP host SDK.
  * **LV2** (ON|OFF): LV2 plugin hosting support. Requires LV2, lilv, and
    suil libraries.
  * **VST2** (ON|OFF): VST2 plugin hosting support. Requires GTK with X11
    support on non-Apple/Windows.
    
    
    
Mensajes de error solucionados


```
cmake -G Ninja -S . -B build
```

aquí en esta parte aparecieron algunos mensajes de error 

FFMPEG_libavdevice_LIBRARIES-NOTFOUND
-- 
--   - libavdevice not found.
-- /usr/lib/i386-linux-gnu/libavutil.so
-- avutil
--   - libavutil 56.70.100 found.
-- FFMPEG_libavfilter_LIBRARIES-NOTFOUND
-- 
--   - libavfilter not found.
-- FFMPEG_libswscale_LIBRARIES-NOTFOUND
-- 
--   - libswscale not found.
-- FFMPEG_libpostproc_LIBRARIES-NOTFOUND

y el paquete que corrigió esto es:

libavdevice-dev


-- The ASM_NASM compiler identification is unknown

la solución fue:

sudo apt install nasm

ese es un
General-purpose x86 assembler

CMake: The ASM_NASM compiler identification is unknown - Master DevOps
https://www.masterdevops.eu/2018/09/11/cmake-the-asm_nasm-compiler-identification-is-unknown/
