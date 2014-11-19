#!/bin/bash

#Install the OS dependencies
#--------------------------------

# Install the Puppet Dependency
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum -y update

yum -y install selinux-policy-targeted ncurses-devel make gcc bc

mkdir /boot/grub

cd /tmp

#get the latest stable linux kernel
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.17.3.tar.xz

#decompress the .tar.xz
tar -xJf linux-3.17.3.tar.xz

zcat /proc/config.gz > .config

mv .config linux-3.17.3/

