#!/bin/bash


for f in submit_*;
  do sed "s/USERX/$APPDIR/" < $f > a_$f ;
  mv a_$f $f ;
done



sed -i 's/USERX/$APPDIR/g' *.*

perl -pi -e 's/USERX/$APPDIR/g' *

find ./ -name sed 's/USERX/$APPDIR/g'

find ./ -name * |xargs perl -pi -e 's/USERX/$APPDIR/g'


este si

grep -RiIl ./ | xargs sed -i 's/USERX/$APPDIR/g'



https://stackoverflow.com/questions/11392478/how-to-replace-a-string-in-multiple-files-in-linux-command-line
To replace a path within files (avoiding escape characters) you may use the following command:

sed -i 's@old_path@new_path@g'

The @ sign means that all of the special characters should be ignored in a following string.



Given you want to search for the string search and replace it with replace across multiple files, this is my battle-tested, one-line formula:

grep -RiIl 'search' | xargs sed -i 's/search/replace/g'

grep -RiIl 'search' | xargs sed -i 's@old_path@new_path@g'

Quick grep explanation:

-R - recursive search
-i - case-insensitive
-I - skip binary files (you want text, right?)
-l - print a simple list as output. Needed for the other commands
The grep output is then piped to sed (through xargs) which is used to actually replace text. The -i flag will alter the file directly. Remove it for a kind of "dry run" mode.




awk '{sub(/{USERX}/,{$APPDIR}); print}' ./



    	                  sed -i -e "s@^Icon=.*@Icon=$APPDIR/src/contents/icon.png@" "$APPDIR"/Shutter-Encoder.desktop
                          sed -i -e "s@^Icon=.*@Icon=$APPDIR/src/contents/icon.png@" "$APPDIR"/Shutter-Encoder.desktop
                          
                          
Now that the adjusted linker is installed, the Binutils build and source directories should be removed.

The next task is to amend the GCC specs file so that it points to the new dynamic linker. A simple sed script will accomplish this:

SPECFILE=`gcc --print-file specs` &&
sed 's@ /lib/ld-linux.so.2@ /tools/lib/ld-linux.so.2@g' \
    $SPECFILE > tempspecfile &&
mv -f tempspecfile $SPECFILE &&
unset SPECFILE

5.9. Ajustar las herramientas
http://www.escomposlinux.org/lfs-es/lfs-es-6.0/chapter05/adjusting.html


sed -e 's@ old_name@ new_name@g'

    find ./ -type f -readable -writable -exec sed -i "s/USERX/$APPDIR/g" {} \;
    
    
    
    
    
#!/bin/bash

#
# Run this to update the user name for the installation
#

APPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ -w "$APPDIR" ]; then
	grep -RiIl ./ | sed -i -e "s@^USERX@$APPDIR@" *
else
	echo "ok"
	exit 1
fi
