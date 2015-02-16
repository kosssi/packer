#!/bin/bash
set -x
set -e

#install -v -o vagrant -g vagrant -m 0700 -d /home/vagrant/.ssh
mkdir ~vagrant/.ssh/
chown vagrant:vagrant ~vagrant/.ssh/
chmod 700 ~vagrant/.ssh/
curl -o /home/vagrant/.ssh/authorized_keys -kL 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys

#groupadd -fr admin
#usermod -a -G admin vagrant

sudo cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
rm -f /etc/sudoers.d/README
#wget -O /etc/sudoers.d/vagrant https://gist.githubusercontent.com/udienz/e7da35b3f059afe52710/raw/72b10b2456ae46f24f23bcad3b8e0499487e4f42/sudoers
echo 'vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers
#chmod 440 /etc/sudoers.d/vagrant

cat <<'EOF' > /home/vagrant/.bash_profile
[ -f ~/.bashrc ] && . ~/.bashrc
export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin
EOF
