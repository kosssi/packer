#!/bin/sh -eux

# Sudoer's
groupadd vagrant
useradd vagrant

zypper install --non-interactive virtualbox-guest-tools 
echo -e "vagrant ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers.d/vagrant
# Zypper lock
zypper --non-interactive rl \*
zypper removerepo "openSUSE-13.2-0"
zypper ar http://download.opensuse.org/distribution/13.2/repo/oss/ openSUSE-13.2-Oss
zypper ar http://download.opensuse.org/distribution/13.2/repo/non-oss/ openSUSE-13.2-Non-Oss
zypper ar http://download.opensuse.org/update/13.2/ openSUSE-13.2-Update
zypper ar http://download.opensuse.org/update/13.2-non-oss/ openSUSE-13.2-Update-Non-Oss
zypper refresh

zypper --non-interactive in tar automake gcc kernel-source kernel-devel
cd /usr/src/linux
make olddefconfig && make prepare && make scripts
