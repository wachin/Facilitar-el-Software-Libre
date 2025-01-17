

# Webcam sin bordes con mplayer

Tener instalado mplayer

    sudo apt install mplayer
    
y poner en una terminal lo siguiente


# Para webcam a 400x300px

    mplayer tv:// -tv driver=v4l2:width=400:height=300 -vo xv -geometry 100%:100% -noborder



Fuente

How to record the screen and webcam at the same time? - Ask Ubuntu
https://askubuntu.com/questions/536563/how-to-record-the-screen-and-webcam-at-the-same-time    
https://askubuntu.com/a/1312587/145772

