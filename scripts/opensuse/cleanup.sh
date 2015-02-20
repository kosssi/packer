#!/bin/bash

# Cleanup
zypper -n rm -u binutils gcc make kernel-default-devel kernel-devel

rm -f ~vagrant/VBoxGuestAdditions.iso
