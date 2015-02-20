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

sudo aptitude -y -q install dkms nfs-common virtualbox-guest-utils virtualbox-guest-dkms lsb-release
sudo sed -i -e 's/security.debian.org/debian-security.klas.or.id/g' /etc/apt/sources.list


# Install necessary dependencies
sudo aptitude -y -q install curl

