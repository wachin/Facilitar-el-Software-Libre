
# To install VNote on MX Linux 21
based in the instructions from:

[https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md)

# Install dependences
   
```
sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake \
     qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools \
     qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools \
     libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev \
     libqt5location5 qtlocation5-dev
```

## VNote depends on some submodules
The next command download VNote and all of these modules:

```
git clone https://github.com/vnotex/vnote.git vnote.git
cd vnote.git
git submodule update --init --recursive
```

**Note:** VNote's source code is available on [GitHub](https://github.com/vnotex/vnote) but if you download but if you download it, the sub modules will not be downloaded there, so you will not be able to compile it.


# Compile VNote

Compile and install VNote:

```
mkdir build
cd build
qmake ../vnote.pro
make
sudo make install
```

opcional, instalar en otro lado


```
mkdir build
cd build
qmake PREFIX=/home/wachin/bin/ ../vnote.pro 
make
make install
```





you may need to wait an hour or less, it depends on your processor

then VNotes is installed under your apps

![111130 VNote in your apps](vx_images/465472211268998.png)

