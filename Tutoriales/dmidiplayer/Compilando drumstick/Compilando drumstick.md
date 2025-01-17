

Pongo en la terminal:
  
    wget -c https://sourceforge.net/projects/drumstick/files/2.7.2/drumstick-2.7.2.tar.gz
    tar -xvzf drumstick-2.7.2.tar.gz
    cd drumstick-2.7.2
    mkdir -p build
    cd build
    cmake -G Ninja ../../drumstick-2.7.2 -DCMAKE_INSTALL_PREFIX:PATH=/usr
    ninja
    sudo ninja install
    cd ..

y poner:

    dh_make -l --copyright gpl3 --email wachin.id@gmail.com --createorig
   
    
y devuelve:

    Maintainer Name     : Washington Indacochea Delgado
    Email-Address       : wachin.id@gmail.com
    Date                : Thu, 10 Nov 2022 12:43:22 -0500
    Package Name        : drumstick
    Version             : 2.7.2
    License             : gpl3
    Package Type        : library
    Are the details correct? [Y/n/q]
    Please respond with "yes", "no" or "quit" (or "y", "n" or "q")
    Skipping creating ../drumstick_2.7.2.orig.tar.xz because it already exists
    Done. Please edit the files in the debian/ subdirectory now.

    Make sure you edit debian/control and change the Package: lines from
    drumstickBROKEN to something else, such as drumstick1

lo cual significa que debo reemplazar:

drumstickBROKEN

por:

drumstick1

en:

    Source: drumstick
    Priority: optional
    Maintainer: Washington Indacochea Delgado <wachin.id@gmail.com>
    Build-Depends: debhelper-compat (= 13), autotools-dev
    Standards-Version: 4.5.1
    Section: libs
    Homepage: <insert the upstream URL, if relevant>
    #Vcs-Browser: https://salsa.debian.org/debian/drumstick
    #Vcs-Git: https://salsa.debian.org/debian/drumstick.git
    Rules-Requires-Root: no

    Package: drumstick-dev
    Section: libdevel
    Architecture: any
    Multi-Arch: same
    Depends: drumstickBROKEN (= ${binary:Version}), ${misc:Depends}
    Description: <insert up to 60 chars description>
    <insert long description, indented with spaces>

    Package: drumstickBROKEN
    Architecture: any
    Multi-Arch: same
    Depends: ${shlibs:Depends}, ${misc:Depends}
    Description: <insert up to 60 chars description>
    <insert long description, indented with spaces>
 

y me queda así:

    Source: drumstick
    Priority: optional
    Maintainer: Washington Indacochea Delgado <wachin.id@gmail.com>
    Build-Depends: debhelper-compat (= 13), autotools-dev
    Standards-Version: 4.5.1
    Section: libs
    Homepage: <insert the upstream URL, if relevant>
    #Vcs-Browser: https://salsa.debian.org/debian/drumstick
    #Vcs-Git: https://salsa.debian.org/debian/drumstick.git
    Rules-Requires-Root: no

    Package: drumstick-dev
    Section: libdevel
    Architecture: any
    Multi-Arch: same
    Depends: drumstick1 (= ${binary:Version}), ${misc:Depends}
    Description: <insert up to 60 chars description>
    <insert long description, indented with spaces>

    Package: drumstick1
    Architecture: any
    Multi-Arch: same
    Depends: ${shlibs:Depends}, ${misc:Depends}
    Description: <insert up to 60 chars description>
    <insert long description, indented with spaces>








 
