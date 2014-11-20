#!/bin/bash

#Install the OS dependencies on CentOS 6.5
#--------------------------------

# Install the Puppet Dependency
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# delete the stock fireall
yum erase -y firewalld

yum -y update

yum -y install selinux-policy-targeted ncurses-devel make gcc bc ruby ntpdate ntp lokkit

# Set the ntp info
ntpdate clock.redhat.com
chkconfig ntpd on
service ntpd start

cd /tmp

#get the latest stable linux kernel
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.17.3.tar.xz

mv /tmp/linux-3.17.3.tar.xz /usr/src/kernels/
cd /usr/src/kernels

#decompress the .tar.xz
tar -xJf linux-3.17.3.tar.xz

cd /usr/src/kernels/linux-3.17.3

zcat /proc/config.gz > .config
