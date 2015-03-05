#!/bin/bash

set -x


DEBIAN_FRONTEND=noninteractive
sed -i -e '/^deb cdrom:/s/^/#/' \
  -e 's/http:\/\/archive.ubuntu.com/http:\/\/buaya.klas.or.id/g' \
  -e 's/http:\/\/us.archive.ubuntu.com/http:\/\/buaya.klas.or.id/g' \
  -e 's/http:\/\/uk.archive.ubuntu.com/http:\/\/buaya.klas.or.id/g' \
  -e 's/http:\/\/gb.archive.ubuntu.com/http:\/\/buaya.klas.or.id/g' \
  -e 's/security.ubuntu.com/buaya.klas.or.id/g' \
  /etc/apt/sources.list
  
#apt-get install sudo -y
  
apt-get update -y
apt-get install sudo -y
sudo su -c 'echo libc6:amd64 libraries/restart-without-asking boolean true| debconf-set-selections'
sudo su -c 'echo libc6 libraries/restart-without-asking boolean true| debconf-set-selections'
apt-get upgrade -y
apt-get dist-upgrade -y
