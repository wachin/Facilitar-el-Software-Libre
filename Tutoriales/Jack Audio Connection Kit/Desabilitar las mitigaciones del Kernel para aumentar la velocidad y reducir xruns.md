#### Disabling Spectre and Meltdown mitigations

![:!:](/lib/images/smileys/icon_exclaim.gif) Warning: disabling these mitigations will make your machine less secure! Use with caution!

To work around the Spectre and Meltdown vulnerabilities several mitigations were built into the kernel. These mitigations can have a negative impact on the performance of your machine. To disable those mitigations and get the most out of your CPU's again you can add the following kernel parameter to your Grub configuration, add it to the value of either `GRUB_CMDLINE_LINUX_DEFAULT` or `GRUB_CMDLINE_LINUX`:

mitigations=off
