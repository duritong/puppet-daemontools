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
        centos: { include daemontools::centos }
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
}

class daemontools::centos {
    # start svscan, it is added to the inittab by the rpm
    # but not started
    exec{'svscanboot &':
        unless => 'ps ax | grep -v grep | grep -q svscan',
    }
}

class daemontools::gentoo inherits daemontools::base {
    Package[daemontools]{
        category => 'sys-process',
    }
    service{svscan:
        ensure => running,
        enable => true,
        hasstatus => true, 
        require => Package[daemontools],
    }

}
