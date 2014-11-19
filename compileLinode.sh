#!/bin/bash

#todo add the bit to configure the make/build file oldconfig menuconfig

make -j3 bzImage
make -j3 modules
make
make install
make modules_install

touch /boot/grub/menu.lst

echo "timeout 5">>/boot/grub/menu.lst
echo "title Custom Compiled, kernel vmlinuz-3.17.3-custom">>/boot/grub/menu.lst
echo "kernel /boot/vmlinuz-3.17.3-custom root=/dev/xvda ro quiet security=selinux selinux=1">>/boot/grub/menu.lst

mv /boot/vmlinuz /boot/vmlinuz-3.17.3-custom

