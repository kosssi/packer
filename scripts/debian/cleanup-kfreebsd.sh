#!/bin/bash
# Debian based scripting
set -x
set -e
DEBIAN_FRONTEND=noninteractive

sudo apt-get remove -y kfreebsd-kernel-headers build-essential dpkg-dev g++

sudo apt-get -y -q autoremove
sudo apt-get -y -q clean
sudo apt-get -y -q autoclean


rm -f /home/vagrant/*.iso
rm -f /tmp/*
#dd if=/dev/zero of=/EMPTY bs=1M
#rm -f /EMPTY
sync
