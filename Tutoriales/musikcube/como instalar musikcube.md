

# Como instalar musikcube

https://github.com/clangen/musikcube/wiki/building

    sudo apt-get install build-essential clang cmake libogg-dev libvorbis-dev libavutil-dev libavformat-dev libswresample-dev libncursesw5-dev libasound2-dev libpulse-dev pulseaudio libmicrohttpd-dev libmp3lame-dev libcurl4-openssl-dev libev-dev libssl-dev libtag1-dev libopenmpt-dev


obtain musikcube sources
you can either get the latest version from git, as follows...

    git clone https://github.com/clangen/musikcube.git --recursive

...or you can download a pre-packaged source release:

navigate to the appropriate release page and download the source tar.gz file

tar xvfz musikcube-0.96.10.tar.gz

# build musikcube

    cd musikcube
    cmake -G "Unix Makefiles" .
    make
    sudo make install
    musikcube

