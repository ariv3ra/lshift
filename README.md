lshift
======
Install OpenShift on Linode Custom Kernels using the CentOS 7 images

#Note: This is not complete at all :-)

###Purpose:

This project guides users in creating a custom linux kernel that will enable you to install OpenShift Origin on a Linode Virtual Private Server.

###Prerequisites:

* Build a new CentOS (version 7) Linode [See this Getting Started Guide](https://www.linode.com/docs/getting-started)

###ToDo Stuff

`$ touch /boot/grub/menu.lst`

Add this content to the `menu.lst` file

```shell
timeout 5

title Custom Compiled, kernel vmlinuz-3.17.3-custom
root (hd0)
kernel /boot/vmlinuz-3.17.3-custom root=/dev/xvda ro quiet security=selinux selinux=1
```  
