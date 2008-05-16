# modules/daemontools/manifests/init.pp - manage daemontools stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "daemontools": }

class daemontools {
    case $operatingsystem {
        gentoo: { include daemontools::gentoo }
        default: { include daemontools::base }
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
