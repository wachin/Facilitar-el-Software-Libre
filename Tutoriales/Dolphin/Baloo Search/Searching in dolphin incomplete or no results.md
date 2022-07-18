
Searching in dolphin incomplete or no results... • KDE Community Forums
https://forum.kde.org/viewtopic.php?f=225&t=130154

 Re: Searching in dolphin incomplete or no results...  Topic is solved
Sat Feb 13, 2016 4:33 pm
running

Code: Select all
    balooctl status

shows files are indexed?

if the files are not indexed could it be baloo is not properly installed/configured? does it work for a new user?


to reset (I think), you will loose any changes manually set in the config file

1)

Code: Select all
    balooctl stop


2) remove ~/.config/baloo* (3 files)
3) remove folder ~/.local/share/baloo
4)

Code: Select all
     balooctl start


5) after a while check the status to make sure files have been indexed 
