#!/bin/bash
# Debian based scripting
set -x
set -e
DEBIAN_FRONTEND=noninteractive
distrib=$(lsb_release -is)

case $distrib in
    Ubuntu)
    	echo "Distro is $distrib"
        sudo apt-get remove -y linux-headers-$(uname -r) linux-firmware linux-image-extra-$(uname -r) build-essential dpkg-dev g++
        ;;
    Debian)
    	echo "Distro is $distrib"
        sudo apt-get remove -y linux-headers-$(uname -r) build-essential dpkg-dev g++
        ;;
    *)
        echo "unknown $distrib"
        ;;
esac

sudo apt-get -y -q autoremove
sudo apt-get -y -q clean
sudo apt-get -y -q autoclean

# delete unused kernels
#dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

rm /home/vagrant/*.iso
rm /tmp/*
#dd if=/dev/zero of=/EMPTY bs=1M
#rm -f /EMPTY
sync
