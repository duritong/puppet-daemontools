# modules/daemontools/manifests/init.pp - manage daemontools stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3
# For rpms for redhat, centos etc. you might want to look here:
# http://summersoft.fay.ar.us/pub/qmail/daemontools/

# modules_dir { "daemontools": }

import "defines.pp"

class daemontools {
    case $operatingsystem {
        gentoo: { include daemontools::gentoo }
        default: { include daemontools::base }
    }

    if $selinux {
        include daemontools::selinux
    }
}

class daemontools::base {
    package{'daemontools':
        ensure => installed,
    }

    service{svscan:
        ensure => running,
        enable => true,
        hasstatus => true, 
        require => Package[daemontools],
    }

}

class daemontools::gentoo inherits daemontools::base {
    Package[daemontools]{
        category => 'sys-process',
    }
}
