



```
xkbprint -color "${DISPLAY}" - |\
    ps2pdf - > current_keyboard_layout.pdf
```


How do I get current keyboard layout?
https://unix.stackexchange.com/questions/12072/how-do-i-get-current-keyboard-layout
https://unix.stackexchange.com/a/520841/312968

o:



xkbprint :0 -o one.ps  
ps2pdf one.ps
evince one.pdf



https://askubuntu.com/questions/476911/in-14-04-how-do-i-print-the-current-keyboard-layout
https://askubuntu.com/a/477034/145772

