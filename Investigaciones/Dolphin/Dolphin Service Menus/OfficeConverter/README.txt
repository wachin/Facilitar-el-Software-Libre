DoAllWithPDF servicemenu
Author: Mathieu PICOT (picotmathieu@gmail.com)


SUMMARY:
KDE Service Menu for office document conversion

DEPENDS: (packages on Ubuntu 14.04, names could change according to the distribution)
    bash
    kde-baseapps-bin
    kde-runtime
    konsole
    qdbus
    libreoffice-common
    
#SUGGESTS: 

INSTALL/UNINSTALL:
    
    On Ubuntu Xenial (16.04) and later:
        you can add the repository to your system to get the service up to date.
        just copy these commands in a terminal:
            sudo add-apt-repository
            sudo apt-get update
            sudo apt-get install kde-service-menu-officeconverter
            
        you can also install all the suite of service-menu 
        (containing DoAllWithPDF, officeconverter, audioconversion, imagemanipulation and mediainfo ) by typing:
            sudo apt-get install houston-service-menus
    
    Via Dolphin:
        IT DOESN'T WORKS ANYMORE SINCE A LONG TIME AGO ! Maybe one day... (September 2016)
        "Configure Dolphin..." -> "Services" -> "Download New Services..."

    By using installation script:
        Extract archive somewhere and go to folder that contains "install.sh" and "deinstall.sh".
        Use "install.sh" to install, "deinstall.sh" to uninstall.
        Scripts use "kdialog" and "kdesudo" to provide GUI. There is no need to use terminal.

    Manually:
        for kde4:
            Copy all .desktop files to
                ~/.kde/share/kde4/services/ServiceMenus/
            or
                /usr/share/kde4/services/ServiceMenus/
            
        for kf5:
            Copy all .desktop files to
                ~/.kde/share/kservices5/ServiceMenus/
            or
                /usr/share/kservices5/ServiceMenus/
            
        Copy DoAllWithPDF_servicemenu.sh to
            /usr/bin/
        or
            /usr/local/bin/
        or
            ~/bin/

Changelog:
    1.0.1 :first release
