

# How to uninstall a package installed with sudo ninja install? #1714
https://github.com/ninja-build/ninja/issues/1714
https://github.com/ninja-build/ninja/issues/1714#issuecomment-568915850

Yes it has nothing to do with ninja, you could ask the same about make - why no uninstall target in make?

CMake doesn't provide one because it's too risky to wipe random files from your system.

But if you want to try, when you invoke install target, it should create a file listing all touched files, so 

    sudo xargs rm < install_manifest.txt

should do.

In worst case, just do a trace (strace) to see which files are touched during install, and wipe them. 
