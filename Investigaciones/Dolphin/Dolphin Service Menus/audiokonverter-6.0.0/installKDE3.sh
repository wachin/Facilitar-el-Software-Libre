#!/bin/bash

cd $(dirname $0)

OLDFILES="oggtowav mp3towav mp3towav.desktop oggtowav.desktop flactowav.desktop wavenc-kdialog mp3tomp3.desktop mp3toogg.desktop oggtomp3.desktop oggtoogg.desktop kwavenc.desktop anytowav.desktop mp3toany.desktop oggtoany.desktop aactoany.desktop flactoany.desktop aactoflac.desktop mp3toflac.desktop oggtoflac.desktop wavenc  mp3tomp3 oggtomp3 mp3toogg oggtoogg oggtoaac mp3toaac aactoaac aactomp3 aactoogg flactomp3 flactoaac flactoogg mp3toflac oggtoflac aactoflac"
SCRIPTS="anytowav audioconvert movie2sound oggdrop-lx"
DESKTOPFILES="audioconvert.desktop audiofrommovie.desktop"
MIMEFILES="x-wavpack.desktop x-flv.desktop amr.desktop"

NEEDED="lame faac faad mplayer oggenc oggdec flac mppdec wvunpack ffmpeg"
OPTIONAL="vorbiscomment metaflac id3info id3v2 id3cp apetag"

PATH=${PATH}:/usr/bin:/usr/local/bin

function check_environ {
#Check to see if we can coax kde-config into the PATH
echo "Checking for kde-config..."
if [ -z "$(type 'kde-config' 2> /dev/null)" ]; then #Odd way of checking if kde-config is in $PATH
  kdialog --error "kde-config not found, checking for \$KDEDIR to compensate..."
  if [ ! -z ${KDEDIR} ]; then
    export PATH=${PATH}:${KDEDIR}/bin
  else
    KDEDIR=$(kdialog --title Where\ is\ KDE\ installed\? --getexistingdirectory / )
    test -z ${KDEDIR} && exit 1
    export PATH=${PATH}:${KDEDIR}/bin
  fi
fi
echo "Okay."
}

function deletelocal {
    rm -f $(kde-config --localprefix)/bin/${1}
    rm -f $(kde-config --localprefix)/share/apps/konqueror/servicemenus/${1}
}

function deleteglobal {
    rm -f $(kde-config --prefix)/bin/${1}
    rm -f $(kde-config --prefix)/share/apps/konqueror/servicemenus/${1}
}

function performchecks {
for prog in $NEEDED
do
 test -z "$(which $prog)" && kdialog --error "You really need the program '${prog}' and I cannot find it!"
 test -z "$(which $prog)" && test "$prog" = "mppdec" && kdialog --error "You can get mppdec from musepack.net."
 test -z "$(which $prog)" && test "$prog" = "wvunpack" && kdialog --error "You can get wvunpack from wavpack.com."
done
for prog in $OPTIONAL
do
 test -z "$(which $prog)" && kdialog --msgbox "For full functionality you need the program '${prog}', but I cannot find it."
done
}

if [ -z $1 ]
then option="--$(kdialog --menu Please\ select\ installation\ type global for\ all\ users remove uninstall removeold uninstall\ outdated\ files  2> /dev/null)"
else option=$1
fi


case $option in
  "--global" )
    if [ "$(id -u)" != "0" ]
     then exec kdesu "$0 --global"
     exit
    fi
    check_environ
    PREFIX=$(kde-config --prefix)
    echo "Installing in $PREFIX ..."
    kdialog --passivepopup "Installing in $PREFIX ..." 1
    ;;
  "-h" )
    echo "Usage: $0 [--global|--remove|--removeold]"
    echo
    echo "--global       attempts a system-wide installation."
    echo "--remove       attempts to remove previous installations."
    echo "--removeold    attempts to remove obsolete files."
    echo
    exit 0
    ;;
  "--help" )
    echo "Usage: $0 [--global|--remove|--removeold]"
    echo
    echo "--global       attempts a system-wide installation."
    echo "--remove       attempts to remove previous installations."
    echo "--removeold    attempts to remove obsolete files."
    echo
    exit 0
    ;;
  "--local" )
    check_environ
    PREFIX=$(kde-config --localprefix)
    echo "Installing in $PREFIX ..."
    kdialog --passivepopup "Installing in $PREFIX ..." 1
    mkdir -p $PREFIX/bin
    mkdir -p $PREFIX/share/apps/konqueror/servicemenus
    mkdir -p $PREFIX/share/mimelnk/audio/
    ;;
  "--remove" )
#uninstall locally:
    check_environ
    echo "Attempting to remove installation."
    kdialog --passivepopup "Attempting to remove installation." 1
    for file in $OLDFILES
    do
    deletelocal "$file"
    done
    for file in $SCRIPTS
    do
    deletelocal "$file"
    done
    for file in $DESKTOPFILES
    do
    deletelocal "$file"
    done
#now uninstall globally:
    if [ "$(id -u)" != "0" ]
     then exec kdesu "$0 --remove"
     exit
    fi
    for file in $OLDFILES
    do
    deleteglobal "$file"
    done
    for file in $SCRIPTS
    do
    deleteglobal "$file"
    done
    for file in $DESKTOPFILES
    do
    deleteglobal "$file"
    done
    echo "Uninstall finished."
    kdialog --passivepopup "Uninstall finished." 1
    exit 0
    ;;
  "--removeold" )
    check_environ
    echo "Attempting to remove obsolete files."
    kdialog --passivepopup "Attempting to remove obsolete files." 1
#uninstall locally:
    for file in $OLDFILES
    do
    deletelocal "$file"
    done
#now uninstall globally:
    if [ "$(id -u)" != "0" ]
     then exec kdesu "$0 --removeold"
     exit
    fi
    for file in $OLDFILES
    do
    deleteglobal "$file"
    done
    echo "Obsolete files deleting finished."
    kdialog --passivepopup "Obsolete files deleting finished." 1
    exit 0
    ;;
  "--debinstall" )
    install -m 644 $DESKTOPFILES /usr/share/apps/konqueror/servicemenus/
    install -m 644 $MIMEFILES /usr/share/mimelnk/audio/
    install -m 755 $SCRIPTS /usr/bin/
    exit 0
    ;;
  "--suseinstall" )
    mkdir -p /opt/kde3/apps/konqueror/servicemenus/
    mkdir -p /opt/kde3/share/mimelnk/audio/
    mkdir -p /opt/kde3/bin/
    install -m 644 $DESKTOPFILES /opt/kde3/apps/konqueror/servicemenus/
    install -m 644 $MIMEFILES /opt/kde3/share/mimelnk/audio/
    install -m 755 $SCRIPTS /opt/kde3/bin/
    exit 0
    ;;
  * )
    echo "Installation cancelled."
    kdialog --passivepopup "Installation cancelled." 1
    exit 1
esac

performchecks
install -m 644 $DESKTOPFILES $PREFIX/share/apps/konqueror/servicemenus/
mkdir -p $PREFIX/share/apps/d3lphin/servicemenus/
install -m 644 $DESKTOPFILES $PREFIX/share/apps/d3lphin/servicemenus/
install -m 644 $MIMEFILES $PREFIX/share/mimelnk/audio/
install -m 755 $SCRIPTS $PREFIX/bin/ && kdialog --passivepopup "Done." 3

echo "Done."
