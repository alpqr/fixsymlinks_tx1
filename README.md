Convert absolute symlinks to relative in the Linux 4 Tegra sample filesystem (L4T R24.2)
in order to make it a usable sysroot for building Qt and others libs/apps.

Usage:
Once image creation and flashing is done, go to Linux_for_Tegra/rootfs and run
    sudo fixsymlinks.sh .
