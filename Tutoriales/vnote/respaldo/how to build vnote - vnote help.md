

https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md

Build VNote

You need Qt 5.15 and above to build VNote from source.
Get the Source Code of VNote

VNote's source code is available on GitHub. You could download the ZIP archive of the code. Please be aware of that VNote depends on some submodules, so you should also download the source codes of these modules
    
Install dependences    
    
    sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev libqt5location5 qtlocation5-dev                     


# Build VNote[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_0)

You need **Qt 5.15** and above to build VNote from source.

## Get the Source Code of VNote[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_1)

VNote's source code is available on [GitHub](https://github.com/vnotex/vnote). You could download the ZIP archive of the code. Please be aware of that VNote depends on some submodules, so you should also download the source codes of these modules.

The recommended way is using **git** like this:

```
git clone https://github.com/vnotex/vnote.git vnote.git
cd vnote.git
git submodule update --init --recursive
```

## Get Qt 5.15[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_2)

You could get the standalone Qt SDK from [Qt Downloads](http://info.qt.io/download-qt-for-application-development). For users in China, you could speed up the download via the [TUNA Mirrors](https://mirrors4.tuna.tsinghua.edu.cn/qt/official_releases/qt/5.15/).

## Windows[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_3)

On Windows, you need **Visual Studio 2015** or above to compile VNote (Mingw is **not** supported).

Open **Qt Creator** and open `vnote.git\vnote.pro` as project. Now you are ready to tune and compile VNote!

## Linux[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_4)

In Ubuntu, you could get Qt 5.15 from PPA like this:

```
sudo add-apt-repository ppa:beineri/opt-qt-5.15.10-bionic -y
sudo apt-get update -qq
sudo apt-get -y install qt512base qt512webengine
sudo apt-get -y install qt512webchannel qt512svg qt512location qt512tools qt512translations
source /opt/qt*/bin/qt*-env.sh
```

Then compile and install VNote like this:

```
cd vnote.git
mkdir build
cd build
qmake ../vnote.pro
make
sudo make install
```

### Fcitx[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_5)

If you use **Fcitx** as the input method, you need to copy the missing library `libfcitxplatforminputcontextplugin.so` to Qt's plugin directory.

To find the place of `libfcitxplatforminputcontextplugin.so`, you could execute:

```
fcitx-diagnose | grep libfcitxplatforminputcontextplugin.so
```

If there is no such lib, you may need to install and configure Fcitx for Qt5 correctly before continue.

Then you need to copy the lib to Qt's plugin directory:

```
<path_to_Qt_installation_directory>/5.15.2/gcc_64/plugins/platforminputcontexts/
```

### OpenSSL[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_6)

After the installation of openSSL, you could find two lib files:

```
/usr/lib/libcrypto.so.1.0.0
/usr/lib/libssl.so.1.0.0
```

Copy these two files to Qt's library directory:

```
<path_to_Qt_installation_directory>/5.15.2/gcc_64/lib/
```

In Qt's library directory, create symlinks for these two files:

```
ln -s libcrypto.so.1.0.0 libcrypto.so
ln -s libssl.so.1.0.0 libssl.so
```

## MacOS[](https://vnotex.github.io/vnote/en_us/#!docs/Developers/Build%20VNote.md#!docs/Developers/Build%20VNote.md#toc_7)






Log de instalación:



wachin@mx21:~/Dev/vnote-build-original/vnote.git/build
$ sudo make install
[sudo] password for wachin: 
cd libs/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/libs.pro ) && make -f Makefile install
make[1]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs'
cd vtextedit/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/vtextedit.pro ) && make -f Makefile install
make[2]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit'
cd src/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/src.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src'
cd libs/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/libs.pro ) && make -f Makefile install
make[4]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs'
cd syntax-highlighting/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/syntax-highlighting/syntax-highlighting.pro ) && make -f Makefile install
make[5]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/syntax-highlighting'
/usr/lib/qt5/bin/qmake -install qinstall -exe libVSyntaxHighlighting.so.1.0.0 /usr/lib/libVSyntaxHighlighting.so.1.0.0
strip --strip-unneeded /usr/lib/libVSyntaxHighlighting.so.1.0.0
ln -f -s libVSyntaxHighlighting.so.1.0.0 /usr/lib/libVSyntaxHighlighting.so
ln -f -s libVSyntaxHighlighting.so.1.0.0 /usr/lib/libVSyntaxHighlighting.so.1
ln -f -s libVSyntaxHighlighting.so.1.0.0 /usr/lib/libVSyntaxHighlighting.so.1.0
make[5]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/syntax-highlighting'
cd katevi/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/katevi/katevi.pro ) && make -f Makefile install
make[5]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/katevi'
make[5]: No se hace nada para 'install'.
make[5]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/katevi'
cd peg-markdown-highlight/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/peg-markdown-highlight/peg-markdown-highlight.pro ) && make -f Makefile install
make[5]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/peg-markdown-highlight'
make[5]: No se hace nada para 'install'.
make[5]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/peg-markdown-highlight'
cd sonnet/data/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/sonnet/data/data.pro ) && make -f Makefile install
make[5]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data'
cd parsetrigrams/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/sonnet/data/parsetrigrams/parsetrigrams.pro ) && make -f Makefile install
make[6]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data/parsetrigrams'
make[6]: No se hace nada para 'install'.
make[6]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data/parsetrigrams'
cd gentrigrams/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/sonnet/data/gentrigrams/gentrigrams.pro ) && make -f Makefile install
make[6]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data/gentrigrams'
make[6]: No se hace nada para 'install'.
make[6]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data/gentrigrams'
make[5]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/data'
cd sonnet/src/core/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/libs/sonnet/src/core/core.pro ) && make -f Makefile install
make[5]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/src/core'
make[5]: No se hace nada para 'install'.
make[5]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs/sonnet/src/core'
make[4]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/libs'
cd editor/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/src/editor/editor.pro ) && make -f Makefile install
make[4]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/editor'
/usr/lib/qt5/bin/qmake -install qinstall -exe libVTextEdit.so.1.0.0 /usr/lib/libVTextEdit.so.1.0.0
strip --strip-unneeded /usr/lib/libVTextEdit.so.1.0.0
ln -f -s libVTextEdit.so.1.0.0 /usr/lib/libVTextEdit.so
ln -f -s libVTextEdit.so.1.0.0 /usr/lib/libVTextEdit.so.1
ln -f -s libVTextEdit.so.1.0.0 /usr/lib/libVTextEdit.so.1.0
make[4]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src/editor'
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/src'
cd tests/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/tests/tests.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests'
cd test_textfolding/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/tests/test_textfolding/test_textfolding.pro ) && make -f Makefile install
make[4]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests/test_textfolding'
make[4]: No se hace nada para 'install'.
make[4]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests/test_textfolding'
cd test_utils/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/tests/test_utils/test_utils.pro ) && make -f Makefile install
make[4]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests/test_utils'
make[4]: No se hace nada para 'install'.
make[4]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests/test_utils'
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/tests'
cd demo/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/vtextedit/demo/demo.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/demo'
make[3]: No se hace nada para 'install'.
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit/demo'
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/vtextedit'
cd QHotkey/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/QHotkey/QHotkey.pro ) && make -f Makefile install
make[2]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey'
cd HotkeyTest/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/QHotkey/HotkeyTest/HotkeyTest.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey/HotkeyTest'
make[3]: No se hace nada para 'install'.
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey/HotkeyTest'
cd QHotkey/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/libs/QHotkey/QHotkey/QHotkey.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey/QHotkey'
make[3]: No se hace nada para 'install'.
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey/QHotkey'
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs/QHotkey'
make[1]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/libs'
cd src/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/src/src.pro ) && make -f Makefile install
make[1]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/src'
/usr/lib/qt5/bin/qmake -install qinstall -exe vnote /usr/bin/vnote
strip /usr/bin/vnote
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/vnote.desktop /usr/share/applications/vnote.desktop
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/16x16/vnote.png /usr/share/icons/hicolor/16x16/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/32x32/vnote.png /usr/share/icons/hicolor/32x32/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/48x48/vnote.png /usr/share/icons/hicolor/48x48/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/64x64/vnote.png /usr/share/icons/hicolor/64x64/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/128x128/vnote.png /usr/share/icons/hicolor/128x128/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/256x256/vnote.png /usr/share/icons/hicolor/256x256/apps/vnote.png
/usr/lib/qt5/bin/qmake -install qinstall /home/wachin/Dev/vnote-build-original/vnote.git/src/data/core/logo/vnote.svg /usr/share/icons/hicolor/scalable/apps/vnote.svg
cp /home/wachin/Dev/vnote-build-original/vnote.git/build/src/vnote_extra.rcc /usr/bin/vnote_extra.rcc
make[1]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/src'
cd tests/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/tests.pro ) && make -f Makefile install
make[1]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests'
cd test_utils/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/test_utils/test_utils.pro ) && make -f Makefile install
make[2]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_utils'
make[2]: No se hace nada para 'install'.
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_utils'
cd test_core/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/test_core/test_core.pro ) && make -f Makefile install
make[2]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core'
cd test_notebook/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/test_core/test_notebook/test_notebook.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core/test_notebook'
make[3]: No se hace nada para 'install'.
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core/test_notebook'
cd test_theme/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/test_core/test_theme/test_theme.pro ) && make -f Makefile install
make[3]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core/test_theme'
make[3]: No se hace nada para 'install'.
make[3]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core/test_theme'
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_core'
cd test_task/ && ( test -e Makefile || /usr/lib/qt5/bin/qmake -o Makefile /home/wachin/Dev/vnote-build-original/vnote.git/tests/test_task/test_task.pro ) && make -f Makefile install
make[2]: se entra en el directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_task'
make[2]: No se hace nada para 'install'.
make[2]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests/test_task'
make[1]: se sale del directorio '/home/wachin/Dev/vnote-build-original/vnote.git/build/tests'
