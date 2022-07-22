




    
                  


# Build VNote[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_0)
[https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md)

To install VNote on MX Linux 21

Install dependences    
    
    sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev libqt5location5 qtlocation5-dev git  

## Get the Source Code of VNote[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_1)

VNote depends on some submodules, the next command download VNote and all of these modules:

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

you may need to wait an hour or less, it depends on your processor

then VNotes is installed under your apps

