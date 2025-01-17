


https://wiki.winehq.org/FAQ#How_do_I_associate_a_native_program_with_a_file_type_in_Wine.3F



6.6.3 How do I associate a native program with a file type in Wine?

There are two ways using which you can associate a native program with a file type. The first method is to use winebrowser and an alternative would be to write a shell script.

The example below uses winebrowser to launch the default PDF handler on your system (on a Unix desktop it uses xdg-open). Save the lines below to a file pdf.reg.

[HKEY_CLASSES_ROOT\.pdf]
@="PDFfile"
"Content Type"="application/pdf"
[HKEY_CLASSES_ROOT\PDFfile\Shell\Open\command]
@="winebrowser \"%1\"" 

Import the .reg file into the registry using the command

regedit $HOME/pdf.reg 

Another option is to use a shell script to call a native application. Save it as run_linux_program under $HOME/bin:

#!/bin/sh $1 "`wine winepath -u "$2"`" 

Don't forget to run chmod a+x $HOME/bin/run_linux_program to make it executable. Also make sure that $HOME/bin directory is in your $PATH. Otherwise it will not work.

To associate (say) .pdf files with the acroread Linux program save the following as $HOME/pdf.reg and then import it with the command regedit $HOME/pdf.reg:

[HKEY_CLASSES_ROOT\.pdf]
@="PDFfile"
"Content Type"="application/pdf"
[HKEY_CLASSES_ROOT\PDFfile\Shell\Open\command]
@="/bin/sh run_linux_program acroread \"%1\"" 

You can reuse this script and just edit the registry file. For example to associate .doc documents with OpenOffice (ooffice):

[HKEY_CLASSES_ROOT\.doc]
@="DOCfile"
"Content Type"="application/msword"
[HKEY_CLASSES_ROOT\DOCfile\Shell\Open\command]
@="/bin/sh run_linux_program ooffice \"%1\"" 

6.6.4 How can I prevent Wine from changing the filetype associations on my system or adding unwanted menu entries/desktop links?

Tango-style info icon.svg Beginning with wine-3.14, winecfg has a "Manage File Associations" checkbox on the Desktop Integration tab. Checking it enables winemenbuilder to create file associations and unchecking it disables that behavior.

Users of older Wine versions and those who also want to disable the creation of menu items can accomplish this by disabling winemenubuilder.exe . There are several ways to do this:

    In winecfg: before running the installer, run winecfg. Go to the Libraries tab and type winemenubuilder.exe into the "New overrides" box (it is not in the dropdown list). Click add, then select it from the "Existing overrides" box. Click "Edit" and select "Disable" from the list, then click "OK".
    Registry file: If you need to apply the setting many times (e.g. every time you recreate the Wine prefix), this approach may be more convenient. Create a text file named with extension .reg (e.g., disable-winemenubuilder.reg) containing the following:

[HKEY_CURRENT_USER\Software\Wine\DllOverrides]
"winemenubuilder.exe"="" 

To apply the setting, run:

regedit disable-winemenubuilder.reg

    Environment variable: set the WINEDLLOVERRIDES environment variable when you run the installer, e.g.,

WINEDLLOVERRIDES=winemenubuilder.exe=d wine setup.exe 

Users who frequently create new wineprefixes may wish to put WINEDLLOVERRIDES=winemenubuilder.exe=d in their .bashrc to avoid having to specify it for every wineprefix. 





versions

https://wiki.winehq.org/Useful_Registry_Keys


