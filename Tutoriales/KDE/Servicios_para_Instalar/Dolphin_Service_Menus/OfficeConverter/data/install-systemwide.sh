#!/bin/bash

[[ "$1" == 'uninstall' ]] && install=false || install=true


default_language(){
    installation="Installation"
    deb_yet_install(){
        echo "$1 package is installed on your system."$'\n'"Please uninstall it with your package manager !"
    }
}

other_languages(){
  case "${LANG%_*}" in
    fr )
      # French
        installation="Installation"
        deb_yet_install(){
            echo "Le paquet $1 est installé sur votre système."$'\n'"Désinstallez-le avec votre gestionnaire de paquets !"
        }
      ;;
    xx )
      # Translate here your own language
      installation="Installation"
      deb_yet_install(){
      echo "$1 package is installed on your system."$'\n'"Please uninstall it with your package manager !"
      }
    ;;
  esac
}

default_language
other_languages
source common_vars || exit 14
script_name="\"$pretty_name\" $installation"

if [ -n $debpackage ] && dpkg -s $debpackage &>/dev/null;then
    kdialog --caption "$script_name" --error "$(deb_yet_install $debpackage)"
    exit 1
fi

type kf5-config  &>/dev/null &&  kf5_service_dir=$(kf5-config  --path services |cut -d':' -f2)
type kde4-config &>/dev/null && kde4_service_dir=$(kde4-config --path services |cut -d':' -f2)
[ -z $kf5_service_dir ] && [ -z $kde4_service_dir ] && exit 11

input_directory=$(echo ServiceMenus/*)

for service_dir in "$kf5_service_dir" "$kde4_service_dir";do
    [ -z "$service_dir" ] && continue
    
    full_service_path="$service_dir/$input_directory"
    [ -d "$full_service_path" ] && ( rm -R "$full_service_path" || exit 11 )
    if $install;then
        cp -R "$input_directory" "$service_dir/ServiceMenus" || exit 21
    fi
    
    if [ -d bin ];then
        for bin_file in bin/*;do
            [ -f "/usr/$bin_file" ] && ( rm "/usr/$bin_file" || exit 41 )
            if $install;then
                cp "$bin_file" "/usr/bin" || exit 51
                chmod +x "/usr/$bin_file" || exit 61
            fi
        done
    fi
    
    if [ -d share ];then
        for share_dir in share/*;do
            share_dir_dest="/usr/$share_dir"
            [ -d "$share_dir_dest" ] && ( rm -R "$share_dir_dest" || exit 71 )
            if $install;then
                cp -R "$share_dir" "/usr/share" || exit 81
            fi
        done
    fi
    
done
# End of installation.
exit 0
