Quadre is an open source code editor for the web, written in JavaScript, HTML and CSS forked from Brackets.

Compiled on MX Linux 21 of 32 bits (based on Debian 11 Bullseye)

**Fix preview in Google-Chrome**
By default Quadre uses Google-Chome for the livepreview but there is no version for Linux 32 bits, but we can install Chromium to use it and have Live Preview

     sudo apt install chromium chromium-l10n chromium-driver chromium-sandbox

Now we need to create a symbolic link:

     sudo ln -s /usr/bin/chromium /bin/google-chrome

and to use you should always fetch your .html files from the option:

File/Open Folder...

then clic:

File/Enable Experimental Live Preview

and next

File/Live Preview

Only then will the preview be loaded in Chromium

**Note**: Reload the Chromium browser if it takes a long time for the preview to appear

**Solutions in:**

**Brackets live preview not working**
This alpha version have a bug with live preview because you open an html proyect and is not possible to see
https://stackoverflow.com/questions/25108420/brackets-live-preview-not-working

Enhacement: Chromium-based forks for live preview · Issue #13010 · adobe/brackets
https://github.com/adobe/brackets/issues/13010

