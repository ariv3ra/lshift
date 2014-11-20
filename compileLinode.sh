#!/bin/bash

#  todo add the bit to configure the make/build file oldconfig menuconfig

#  Manually Run
#
#  make oldconfig
#  make menuconfig
#
#
rm -rf /boot/*
mkdir /boot/grub

make -j3 bzImage
make -j3 modules
make
make install
make modules_install

# Create the new menu.lst file
touch /boot/grub/menu.lst

# Populate the menu.lst file with the boot info
echo "timeout 5">>/boot/grub/menu.lst
echo "title Custom Compiled, kernel vmlinuz-3.17.3-custom">>/boot/grub/menu.lst
echo "root (hd0)">>/boot/grub/menu.lst
echo "kernel /boot/vmlinuz-3.17.3-custom root=/dev/xvda ro quiet security=selinux selinux=1">>/boot/grub/menu.lst

# Rename the new kernel
mv /boot/vmlinuz /boot/vmlinuz-3.17.3-custom

