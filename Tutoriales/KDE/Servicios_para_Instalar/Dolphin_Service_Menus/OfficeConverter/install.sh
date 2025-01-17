#!/bin/bash



# Translations:
default_language(){
  installation="Installation"
  install="Install:"
  just_for_me="Just for me."
  system_wide="System wide. (You must be one of system administrators)"
  message_incorrect_working_dir="Incorrect working directory!\n\"$PWD/data\" not found!"
  message_files_missing="One or more files are missing!"
  message_installation_completed="Installation completed."
  message_installation_failed="Installation failed!"
}

other_languages(){
  case "${LANG%_*}" in
    fr )
      # French
      installation="Installation"
      install="Installer:"
      just_for_me="Juste pour moi.($USER)"
      system_wide="Pour tout le système. (Vous devez être l'un des administrateurs)"
      message_incorrect_working_dir="Répertoire de travail non valide!\n\"$PWD/data\" non trouvé!"
      message_files_missing="Un ou plusieurs fichiers sont manquants!"
      message_installation_completed="Installation terminée."
      message_installation_failed="Échec de l'installation!"
      ;;
    fi )
      # Finnish
      installation="Asennus"
      install="Asenna:"
      just_for_me="Vain minulle.($USER)"
      system_wide="Kaikille käyttäjille. (Sinun täytyy olla järjestelmänvalvoja)"
      message_incorrect_working_dir="Virheellinen työkansio.\nKohdetta \"$PWD/data\" ei löydy!"
      message_files_missing="Yksi tai useampi tiedosto puuttuu!"
      message_installation_completed="Asennus suoritettu loppuun."
      message_installation_failed="Asennus epäonnistui!"
      ;;

    xx )
      # Translate here your own language
      installation="Installation"
      install="Install:"
      just_for_me="Just for me.($USER)"
      system_wide="System wide. (You must be one of system administrators)"
      message_incorrect_working_dir="Incorrect working directory!\n\"$PWD/data\" not found!"
      message_files_missing="One or more files are missing!"
      message_installation_completed="Installation completed."
      message_installation_failed="Installation failed!"
    ;;
  esac
}

install_failure(){
    kdialog --caption "$script_name" --error "$message_installation_failed"$'\n'"code: $1"
    exit $1
}



default_language
other_languages

script_name="\"$pretty_name\" $installation"

# End of translations.

cd "$(dirname "$0")"/data || ( kdialog --caption "$script_name" --error "$message_incorrect_working_dir" ; exit 1 )
source common_vars || install_failure 6
script_name="\"$pretty_name\" $installation"


# Installation:
choise=$(kdialog --caption "$script_name" --radiolist "$install $servicename" 1 "$just_for_me" on 2 "$system_wide" off) || exit 0 # Selection dialog.

  case "$choise" in
    1 )		# If "Just for me." selected, do:
        type kf5-config  &>/dev/null &&  kf5_service_dir=$(kf5-config  --path services |cut -d':' -f1)
        type kde4-config &>/dev/null && kde4_service_dir=$(kde4-config --path services |cut -d':' -f1)
        [ -z $kf5_service_dir ] && [ -z $kde4_service_dir ] && install_failure 11
        
        for service_dir in "$kf5_service_dir" "$kde4_service_dir";do
            [ -z "$service_dir" ] && continue
            
            input_directory=$(echo ServiceMenus/*)
            full_service_path="$service_dir/ServiceMenus/${input_directory##*/}"
            [ -d "$full_service_path" ] && ( rm -R "$full_service_path" || install_failure 12 )
            cp -R "$input_directory" "$service_dir/ServiceMenus" || install_failure 21
        
            for desktop_file in "$full_service_path"/*;do
                sed -i 's/^Exec.*=/&.\//' "$desktop_file" || install_failure 31
            done
            
            if [ -d bin ];then
                mkdir -p "$full_service_path/bin" || install_failure 41
                
                for bin_file in bin/*;do
                    if [ -f "$bin_file" ];then
                        cp "$bin_file" "$full_service_path/bin" || install_failure 51
                        chmod +x "$full_service_path/bin/${bin_file##*/}" || install_failure 61
                    fi
                done
            fi
            
            if [ -d share ];then
                for share_dir in share/*;do
                    share_dir_dest="$HOME/.local/share/${share_dir##*/}"
                    [ -d "$share_dir_dest" ] && ( rm -R "$share_dir_dest" || install_failure 71 )
                    cp -R "$share_dir" "$HOME/.local/share" || install_failure 81
                done
            fi
            
        done
        
    ;;
    2 ) # If "System wide." selected, do:
        chmod +x  install-systemwide.sh || install_failure 99
        kdesudo ./install-systemwide.sh || install_failure $?
  esac

if type kbuildsyscoca5 &>/dev/null;then
    kbuildsyscoca5
elif type kbuildsyscoca4 &>/dev/null;then
    kbuildsyscoca4
fi

kdialog --caption "$script_name" --icon "info" --msgbox "$message_installation_completed"	#Information dialog.
# End of installation.
exit 0
