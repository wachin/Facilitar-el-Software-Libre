Nullsoft Scriptable Install System is also known as [NSIS](https://nsis.sourceforge.io/Main_Page "NSIS") open-source system to create Windows application installers. NSIS is a script-based system allowing you to create the logic behind your installer/setup file in a complex way to install tasks. NSIS offers plug-ins and other scripts, for example, to download/install 3rd-party files or communicate with Windows.

## The tutorial application

This tutorial will guide you through installing and creating your first Windows installer with *Nullsoft Scriptable Install System* and how to compile your project. [Captura Portable](https://mathewsachin.github.io/Captura/ "Captura Portable") will be used as "our application" for the sake of this tutorial.

## Installation
Head to [NSIS](https://nsis.sourceforge.io/Download "NSIS") official site and download the latest release and install it. Run NSIS and you will be welcomed with a menu like below, It's always a good practice to read the Documentation before jumping in to it.


## Structure
Structure is key, not only in code/scripting but also in everyday life. Structuring your files and folder is important for easy access, locate various files and versions.

Navigate to your Documents and create a new folder named **NSIS** and sub-folder after your project name, In our case **Captura**. Your path should look something like this

``` bash
C:\Users\Bitxo\Documents\NSIS\Captura
```

Navigate in to your project directory **"Captura"** and create following files and folders.
``` bash
Captura
 ├── app
 ├── assets
 ├── license.txt 
 ├── redist
 └── setup.nsi 
```

- **app** directory is for your project,  You can also pretend that it is "root" directory for your project.
- **assets:** This directory is only for NSIS script.
- **license.txt:** (Optional) Can be located in your app directory. Show license to end-user in the install application.
- **redist:** this directory you can include DirectX or any other third-party software needed for your install application *(Parent folder for each third-party software)*.

Your file/directory structure should look similar to the **Captura example** witch also covers third-party software in its tree.


``` bash
Captura
 ├── app
 │   ├── captura-cli.exe 
 │   ├── captura-cli.exe.config
 │   ├── captura.exe 
 │   ├── captura.exe.config
 │   ├── keymaps 
 │   ├── languages 
 │   ├── lib
 │   ├── licenses
 ├── assets
 │   ├── head.bmp 
 │   └── welcome.bmp
 ├── license.txt
 ├── redist
 │   └── directx
 │       └── dxwebsetup.exe
 │
 └── setup.nsi 
```

## BITMAP (Optional)
NSIS offers header and welcome image in bmp format. Great opportunity to promote your company or maybe another project you may have.

| MUI_HEADERIMAGE_BITMAP  | MUI_WELCOMEFINISHPAGE_BITMAP  |
| ------------ | ------------ |
| head.bmp  |  welcome.bmp |
| 150x57 pixels  |  164x314 pixels |
| ![Bitxo NSIS Head images](https://imgur.com/XLsIDfK.jpg)  | ![Bitxo NSIS Welcome images](https://i.imgur.com/l2KlxKE.jpg)  |


## The beginning of scripting
NSIS language for scripting is something between PHP and assembly, slightly more to assembly.

> Lines starting with **;** are comments, You may also comment out lines of code but comments placed before code will be ignored.

Edit setup.nsi in your project directory with your favorite text editor. At the start of the document we need to including a few things.

- **MUI2.nsh** also know as **Modern User Interface 2** provides a user interface (UI).

- **logiclib.nsh** provides familiar logic and easier flow with things like if, else, while loops etc.

``` bash
;--------------------------------
; Includes

  !include "MUI2.nsh"
  !include "logiclib.nsh"
```

## About !define
The !define commands will add gflag to the global define list, in other words when you declare !define it will be global and accessed all over the script and even inside another !defines.

Create global define with **!define**
```bash
!define hello "Capten"
```

Retrieve data from **hello**
```bash
${hello}
```

Remove item from the global define list with **undef**
```bash
!undef hello
```


## Add defines
The purpose with this define list is to avoid entering same content multiple times, In the next step this will make sense.
```bash
;--------------------------------
; Custom defines
  !define NAME "Captura"
  !define APPFILE "captura.exe"
  !define VERSION "7.0.0"
  !define SLUG "${NAME} v${VERSION}"
```

## General
At first glance you noticed repeated calls to custom defines in the previous step and other arguments.

- **Name:** Set name of the installer window.
- **OutFile:** Set name of compiled installer by MakeNSISW.
- **InstallDir:** Specify the default installation directory manualy or with [constants](https://nsis.sourceforge.io/Docs/Chapter4.html#variables "constants").
- **InstallDirRegKey:** Tells the installer to check a string in the registry and use it as the install dir if valid.
- **RequestExecutionLevel:** Specifies request by user level.

```bash
;--------------------------------
; General

  Name "${NAME}"
  OutFile "${NAME} Setup.exe"
  InstallDir "$PROGRAMFILES\${NAME}"
  InstallDirRegKey HKCU "Software\${NAME}" ""
  RequestExecutionLevel admin
```

## Icon & Banners
Set Icon, Banners and Welcome title message.
```bash
;--------------------------------
; UI
  
  !define MUI_ICON "assets\captura.ico"
  !define MUI_HEADERIMAGE
  !define MUI_WELCOMEFINISHPAGE_BITMAP "assets\welcome.bmp"
  !define MUI_HEADERIMAGE_BITMAP "assets\head.bmp"
  !define MUI_ABORTWARNING
  !define MUI_WELCOMEPAGE_TITLE "${SLUG} Setup"
```

## Pages
Define pages to use with !insertmacro witch inserts content from a macro created with !macro. Pages will appear in the order you set.

```bash
;--------------------------------
; Pages
  
  ; Installer pages
  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_LICENSE "license.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  ; Uninstaller pages
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
  ; Set UI language
  !insertmacro MUI_LANGUAGE "English"
```

## Install DirectX
Create option to install third-party software like DirectX.

- **SetOutPath:** Sets output path and create.
- **File:** Extract file(s) to output path.
- **DetailPrint:** Add string to details view.
- **ExecWait:** Execute program and wait for process to end.

```bash
;--------------------------------
; Section - DirectX

  Section "DirectX" DirectX
    SetOutPath "$INSTDIR\Redist"
    File "redist\directx\dxwebsetup.exe"
    DetailPrint "Running DirectX Setup..."
    ExecWait "$INSTDIR\Redist\dxwebsetup.exe"
    DetailPrint "Finished DirectX Setup"
  SectionEnd
```

## Install Captura
This section is hidden from the user with **-hidden** argument and force check with **SectionIn RO**. WriteRegStr stores the installation folder and WriteUninstaller creates the uninstaller.
```bash
;--------------------------------
; Section - Install App

  Section "-hidden app"
    SectionIn RO
    SetOutPath "$INSTDIR"
    File /r "app\*.*" 
    WriteRegStr HKCU "Software\${NAME}" "" $INSTDIR
    WriteUninstaller "$INSTDIR\Uninstall.exe"
  SectionEnd
```

## Create Shortcut
Create option to create desktop Shortcut for user or not.
```bash
;--------------------------------
; Section - Shortcut

  Section "Desktop Shortcut" DeskShort
    CreateShortCut "$DESKTOP\${NAME}.lnk" "$INSTDIR\${APPFILE}"
  SectionEnd
```

## Set Section Description
Set description for each section visible.
```bash
;--------------------------------
; Descriptions

  ;Language strings
  LangString DESC_DeskShort ${LANG_ENGLISH} "Create Shortcut on Dekstop."
  LangString DESC_DirectX ${LANG_ENGLISH} "Microsoft DirectX is a collection of application programming interfaces for handling tasks related to multimedia."

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${DeskShort} $(DESC_DeskShort)
    !insertmacro MUI_DESCRIPTION_TEXT ${DirectX} $(DESC_DirectX)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
```

## Remove empty parent directories
[RMDirUP](https://nsis.sourceforge.io/Recursively_remove_empty_parent_directories "un.RMDirUP") is used to recursively delete empty parent folders of a given folder. This function is used with uninstaller. The command **RMDir /r "$INSTDIR"** cant remove parent folder.
```bash
;--------------------------------
; Remove empty parent directories

  Function un.RMDirUP
    !define RMDirUP '!insertmacro RMDirUPCall'

    !macro RMDirUPCall _PATH
          push '${_PATH}'
          Call un.RMDirUP
    !macroend

    ; $0 - current folder
    ClearErrors

    Exch $0
    ;DetailPrint "ASDF - $0\.."
    RMDir "$0\.."

    IfErrors Skip
    ${RMDirUP} "$0\.."
    Skip:

    Pop $0

  FunctionEnd
```

## Remove empty parent directories
This section in called with uninstaller. Removes shortcut and any other associated files. Command **RMDir /r "$INSTDIR"** does not remove the parent folder there for is function RMDirUP called last for cleanup.
```bash
;--------------------------------
; Section - Uninstaller

Section "Uninstall"

  ;Delete Shortcut
  Delete "$DESKTOP\${NAME}.lnk"

  ;Delete Uninstall
  Delete "$INSTDIR\Uninstall.exe"

  ;Delete Folder
  RMDir /r "$INSTDIR"
  ${RMDirUP} "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\${NAME}"

SectionEnd
```

## Compile
Last to do is compiling the script and get your setup file. Select **setup.nsi** then <kbd>MOUSE</kbd> + <kbd>RIGHT-CLICK</kbd> and **Compile NSIS Script**. When compiling is finished, Press <kbd>Test installer</kbd>

