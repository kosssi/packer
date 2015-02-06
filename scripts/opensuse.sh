#!/bin/sh -eux

# Sudoer's
echo -e "vagrant ALL=(ALL) NOPASSWD: ALL\n" >> /etc/sudoers.d/vagrant
# Zypper lock
zypper --non-interactive rl \*
zypper removerepo "openSUSE-13.2-0"
zypper ar http://download.opensuse.org/distribution/13.2/repo/oss/ openSUSE-13.2-Oss
zypper ar http://download.opensuse.org/distribution/13.2/repo/non-oss/ openSUSE-13.2-Non-Oss
zypper ar http://download.opensuse.org/update/13.2/ openSUSE-13.2-Update
zypper ar http://download.opensuse.org/update/13.2-non-oss/ openSUSE-13.2-Update-Non-Oss
zypper refresh

# Cleanup
zypper -n rm -u binutils gcc make perl ruby kernel-default-devel kernel-devel
