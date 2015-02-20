#!/bin/bash

release=$(lsb_release -cs)
DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null
sudo apt-get dist-upgrade -y -qq > /dev/null

case "$release" in
    lucid)
    sudo dpkg-reconfigure -f noninteractive virtualbox-ose-guest-dkms
    ;;
    *)
    sudo dpkg-reconfigure -f noninteractive virtualbox-guest-dkms
    ;;
esac
