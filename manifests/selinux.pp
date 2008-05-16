# manifests/selinux.pp

class daemontools::selinux {
    case $operatingsystem {
        gentoo: { include daemontools::selinux::gentoo }
        default: { info("No selinux stuff yet defined for your operatingsystem") }
    }
}

class daemontools::selinux::gentoo {
    package{'selinux-daemontools':
        ensure => present,
        category => 'sec-policy',
        require => Package[daemontools],
    }
    selinux::loadmodule {"daemontools": require => Package[selinux-daemontools] }
}

