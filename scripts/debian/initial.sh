#!/bin/bash
# Debian based scripting
set -e
set -x

release=$(lsb_release -cs)
DEBIAN_FRONTEND=noninteractive

# Updating and Upgrading dependencies
sudo apt-get install aptitude -y
sudo apt-get update -y -qq > /dev/null
sudo apt-get upgrade -y -qq > /dev/null

# Install necessary libraries for guest additions and Vagrant NFS Share

case "$release" in
    lucid)
    sudo aptitude -y -q install dkms nfs-common virtualbox-ose-guest-utils virtualbox-ose-guest-dkms lsb-release
    ;;
    *)
    sudo aptitude -y -q install dkms nfs-common virtualbox-guest-utils virtualbox-guest-dkms lsb-release
    ;;
esac

# Install necessary dependencies
sudo aptitude -y -q install curl

# Setup sudo to allow no-password sudo for "admin"
#groupadd -r admin
#usermod -a -G admin vagrant
