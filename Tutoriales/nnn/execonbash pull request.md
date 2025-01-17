script execonbash to open directly scripts .sh with bash with example "; + o"

I am using the nnn file manager in Linux in the terminal and I want to run some .sh files which are scripts that I have, to run them I do the following in nnn I put myself on top of the script.sh and I press "Ctrl + O" and it asks me: "open with" and I write: "bash" and I press Enter and it asks me: "c" li "g" ui? and I put c and it runs there ok. But I need my scripts to open in fewer steps, this is the solution. This script is called execonbash

![execonbash-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/aa963668-0160-4246-823c-5d4726d6273c)

**Note**: On my keyboard to get ; I first have to press "Shift + ;"

The script I'm using in the gif is to automate doing git add . git commit -m and git push and it contains:

#!/bin/bash
### Auto push script
echo "Agregando cambios al stage..."
git add .
echo "Realizando commit..."
git commit -m "Actualización $(date)"
echo "Enviando cambios al repositorio remoto..."
git push origin main
echo "Proceso finalizado."
read

I am a spanish parlant
