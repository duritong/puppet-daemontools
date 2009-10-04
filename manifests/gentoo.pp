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
