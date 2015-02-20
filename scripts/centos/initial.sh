#!/bin/bash

set -x
release=$(awk {'print$3'} /etc/redhat-release)


case "$release" in
    5.11)
    	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.$(uname -p).rpm
        rpm -ivh rpmforge-release-0.5.3-1.el7.rf.$(uname -p).rpm
        wget http://dl.fedoraproject.org/pub/epel/5/$(uname -p)/epel-release-5-4.noarch.rpm
        rpm -ivh epel-release-5-4.noarch.rpm
        ;;
    6.6)
    	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.$(uname -p).rpm
        rpm -ivh rpmforge-release-0.5.3-1.el6.rf.$(uname -p).rpm
        wget http://dl.fedoraproject.org/pub/epel/6/$(uname -p)/epel-release-6-8.noarch.rpm
        rpm -ivh epel-release-6-8.noarch.rpm
        ;;
    7.0.1406)
    	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.$(uname -p).rpm
        rpm -ivh rpmforge-release-0.5.3-1.el7.rf.$(uname -p).rpm
        wget http://dl.fedoraproject.org/pub/epel/7/$(uname -p)/e/epel-release-7-5.noarch.rpm
        rpm -ivh epel-release-7-5.noarch.rpm
        ;;
    *)
        echo ""
        ;;
esac

yum update -y
yum install dkms sudo -y
rm *.rpm -f
