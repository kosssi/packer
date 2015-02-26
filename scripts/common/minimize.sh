#!/bin/sh -eux

# Whiteout the swap partition to reduce box size 
# Swap is disabled till reboot 
readonly swapuuid=$(sudo /sbin/blkid -o value -l -s UUID -t TYPE=swap)
readonly swappart=$(readlink -f /dev/disk/by-uuid/"$swapuuid")
sudo /sbin/swapoff "$swappart"
sudo dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed" 
sudo /sbin/mkswap -U "$swapuuid" "$swappart"

#sudo /bin/su -c "dd if=/dev/zero of=/EMPTY bs=1M"
sudo dd if=/dev/zero of=/EMPTY bs=1M | true
sudo rm -f /EMPTY
#sudo /bin/su -c "rm -f /EMPTY"
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sudo sync
