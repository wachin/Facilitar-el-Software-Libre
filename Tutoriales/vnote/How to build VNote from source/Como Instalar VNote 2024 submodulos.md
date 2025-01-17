

sudo apt-get install cmake build-essential libqt5x11extras5-dev qt5-qmake \
     qtbase5-dev-tools extra-cmake-modules qtdeclarative5-dev-tools \
     qtdeclarative5-dev qtcreator qttools5-dev qttools5-dev-tools \
     libqt5svg5-dev qtwebengine5-dev libqt5svg5-dev \
     libqt5location5 qtlocation5-dev
     
sudo apt install qt6-5compat-dev qt6-svg-dev qt6-languageserver-dev \
	qt6-multimedia-dev qt6-declarative-dev pyqt6-webengine-dev qt6-webengine-dev \
	qt6-base-dev-tools qt6-positioning-dev qt6-serialport-dev \
	libfcitx5-qt6-dev qt6-websockets-dev qt6-websockets-private-dev \
	qt6-charts-dev pyqt6-webengine-dev

- - - - - - 	
	
   ```
   git clone https://github.com/vnotex/vnote.git
   cd vnote
   git submodule update --init --recursive
   ``` 



   ```
   git clone https://github.com/vnotex/vnote.git
   cd vnote
   git checkout v3.18.2
   git submodule update --init --recursive
   ```   



y 

mkdir build && cd build
cmake ..
make



