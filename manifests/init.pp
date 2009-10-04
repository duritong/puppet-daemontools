# modules/daemontools/manifests/init.pp - manage daemontools stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# For rpms for redhat, centos etc. you might want to look here:
# http://summersoft.fay.ar.us/pub/qmail/daemontools/

class daemontools {
    case $operatingsystem {
        gentoo: { include daemontools::gentoo }
        centos: { include daemontools::centos }
        default: { include daemontools::base }
    }
}
