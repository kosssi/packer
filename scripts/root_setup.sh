#!/bin/bash

set -e

sudo wget http://buaya.klas.or.id/etc/src-list-trusty.txt -O /etc/apt/sources.list
# Updating and Upgrading dependencies
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null

# Install necessary libraries for guest additions and Vagrant NFS Share
sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common

# Install necessary dependencies
sudo apt-get -y -q install curl wget git vim htop iftop

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
<<<<<<< HEAD
echo "vagrant ALL=NOPASSWD: ALL" > /etc/sudoers.d/vagrant
=======
>>>>>>> 5fbd08f40f8f2431bbb634460f603eb0d5f17183
