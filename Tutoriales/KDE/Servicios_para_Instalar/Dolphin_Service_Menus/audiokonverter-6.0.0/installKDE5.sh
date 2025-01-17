#!/bin/bash

cd $(dirname $0)

OLDFILES="oggtowav mp3towav mp3towav.desktop oggtowav.desktop flactowav.desktop wavenc-kdialog mp3tomp3.desktop mp3toogg.desktop oggtomp3.desktop oggtoogg.desktop kwavenc.desktop anytowav.desktop mp3toany.desktop oggtoany.desktop aactoany.desktop flactoany.desktop aactoflac.desktop mp3toflac.desktop oggtoflac.desktop wavenc  mp3tomp3 oggtomp3 mp3toogg oggtoogg oggtoaac mp3toaac aactoaac aactomp3 aactoogg flactomp3 flactoaac flactoogg mp3toflac oggtoflac aactoflac"
SCRIPTS="anytowav5 audioconvert5 movie2sound5"
DESKTOPFILES="audioconvert5.desktop audiofrommovie5.desktop"
MIMEFILES="x-wavpack.desktop x-flv.desktop amr.desktop"

NEEDED="lame faac faad mplayer oggenc oggdec flac mppdec wvunpack ffmpeg"
OPTIONAL="vorbiscomment metaflac id3info id3v2 id3cp apetag"

PATH=${PATH}:/usr/bin:/usr/local/bin:$HOME/bin

function check_environ {
#Check to see if we can coax kf5-config into the PATH
echo "Checking for kf5-config..."
if [ -z "$(type 'kf5-config' 2> /dev/null)" ]; then #Odd way of checking if kf5-config is in $PATH
  kdialog --error "kf5-config not found, checking for \$KDEDIR to compensate..."
  echo "kf5-config not found, checking for \$KDEDIR to compensate..."
  if [ ! -z ${KDEDIR} ]; then
    export PATH=${PATH}:${KDEDIR}/bin
  else
    KDEDIR=$(kdialog --title Where\ is\ KDE5\ installed\? --getexistingdirectory / )
    test -z ${KDEDIR} && exit 1
    export PATH=${PATH}:${KDEDIR}/bin
  fi
fi
echo "Okay."

LSMPATH=$(kf5-config --path services|sed {'s/\:.*//g'})
GSMPATH=$(kf5-config --path services|sed {'s/.*\://g'})
}

function deletelocal {
    rm -f ${HOME}/bin/${1}
    rm -f ${LSMPATH}/${1}
    echo deleted ${LSMPATH}/${1}
}

function deleteglobal {
    rm -f $(kf5-config --prefix)/bin/${1}
    rm -f ${GSMPATH}/${1}
    echo deleted ${GSMPATH}/${1}
}

function performchecks {
for prog in $NEEDED
do
 test -z "$(which $prog)" && kdialog --error "You really need the program '${prog}' and I cannot find it!"
 test -z "$(which $prog)" || echo "${prog} found in $(which $prog)."
 test -z "$(which $prog)" && test "$prog" = "mppdec" && kdialog --error "You can get mppdec from musepack.net."
 test -z "$(which $prog)" && test "$prog" = "wvunpack" && kdialog --error "You can get wvunpack from wavpack.com."
 test -z "$(which $prog)" && test "$prog" = "mppdec" && echo "You can get mppdec from musepack.net."
 test -z "$(which $prog)" && test "$prog" = "wvunpack" && echo "You can get wvunpack from wavpack.com."
done
# test -z "$(which ffmpeg)" || test -z "$(which avconv)" || kdialog --error "You really need 'ffmpeg' or 'avconv' and I cannot find it!"
for prog in $OPTIONAL
do
 test -z "$(which $prog)" && kdialog --msgbox "For full functionality you need the program '${prog}', but I cannot find it."
 test -z "$(which $prog)" || echo "${prog} found in $(which $prog)."
done
}

if [ -z $1 ]
then option="--$(kdialog --menu Please\ select\ installation\ type global for\ all\ users remove uninstall removeold uninstall\ outdated\ files  2> /dev/null)"
else option=$1
fi


case $option in
  "--global" )
    if [ "$(id -u)" != "0" ]
     then exec kdesu -c "$0 --global"
     exit
    fi
    check_environ
    SMPATH=${GSMPATH}
    PREFIX=$(kf5-config --prefix)
    echo "Installing in $PREFIX ..."
    kdialog --passivepopup "Installing in $PREFIX ..." 1
    echo Installing in $PREFIX ...
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
    SMPATH=${LSMPATH}
    PREFIX=${HOME}/.local
    echo "Installing in $PREFIX ..."
    kdialog --passivepopup "Installing in $PREFIX ..." 1
    echo Installing in $PREFIX ...
    echo "export PATH=\$PATH:$HOME/bin" >> $HOME/.profile
    mkdir -p $HOME/bin
    mkdir -p $SERVPATH/ServiceMenus
    mkdir -p $PREFIX/share/mimelnk/audio/
    ;;
  "--remove" )
#uninstall locally:
    check_environ
    echo "Attempting to remove installation."
    kdialog --passivepopup "Attempting to remove installation." 1
    echo "Attempting to remove installation."
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
     then exec kdesu -c "$0 --remove"
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
    echo "Uninstall finished."
    exit 0
    ;;
  "--removeold" )
    check_environ
    echo "Attempting to remove obsolete files."
    kdialog --passivepopup "Attempting to remove obsolete files." 1
    echo "Attempting to remove obsolete files."
#uninstall locally:
    for file in $OLDFILES
    do
    deletelocal "$file"
    done
#now uninstall globally:
    if [ "$(id -u)" != "0" ]
     then exec kdesu -c "$0 --removeold"
     exit
    fi
    for file in $OLDFILES
    do
    deleteglobal "$file"
    done
    echo "Obsolete files deleting finished."
    kdialog --passivepopup "Obsolete files deleting finished." 1
    echo "Obsolete files deleting finished."
    exit 0
    ;;
  "--debinstall" )
    install -vm 644 $DESKTOPFILES /usr/share/kde4/services/ServiceMenus/
    install -vm 644 $MIMEFILES /usr/share/mimelnk/audio/
    install -vm 755 $SCRIPTS /usr/bin/
    exit 0
    ;;
  "--suseinstall" )
    mkdir -p /usr/share/kde4/services/ServiceMenus/
    mkdir -p /usr/share/kde4/share/mimelnk/audio/
#    mkdir -p /usr/share/kde4/bin/
    install -vm 644 $DESKTOPFILES /usr/share/kde4/services/ServiceMenus/
    install -vm 644 $MIMEFILES /usr/share/kde4/share/mimelnk/audio/
    install -vm 755 $SCRIPTS /usr/bin/
#    mkdir -p /usr/share/kde4/apps/d3lphin/servicemenus/
#    install -vm 644 $DESKTOPFILES /usr/share/kde4/apps/d3lphin/servicemenus/
    echo -e "\nYou need to install kde5-kdialog:   sudo zypper install kde5-kdialog\n"
    exit 0
    ;;
  * )
    echo "Installation cancelled."
    kdialog --passivepopup "Installation cancelled." 1
    echo "Installation cancelled."
    exit 1
esac

performchecks
mkdir -p $SMPATH/
install -vm 644 $DESKTOPFILES $SMPATH/
mkdir -p $PREFIX/share/apps/d3lphin/servicemenus/
install -vm 644 $DESKTOPFILES $PREFIX/share/apps/d3lphin/servicemenus/
install -vm 644 $MIMEFILES $PREFIX/share/mimelnk/audio/
install -vm 755 $SCRIPTS $HOME/bin/ && kdialog --passivepopup "Done." 3

echo "Done."
