#!/bin/bash

mkdir /tmp/vbox
VER=$(cat /home/vagrant/.vbox_version)
	if [ -f /home/vagrant/VBoxGuestAdditions_$VER.iso ] ; then
		mount -o loop /home/vagrant/VBoxGuestAdditions_$VER.iso /tmp/vbox
		else
		mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/vbox
		fi
sh /tmp/vbox/VBoxLinuxAdditions.run install --force
rm -rf /usr/lib/VBoxGuestAdditions
ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
umount /tmp/vbox
rmdir /tmp/vbox
rm /home/vagrant/*.iso
