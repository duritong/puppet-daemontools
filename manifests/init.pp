# modules/skeleton/manifests/init.pp - manage skeleton stuff
# Copyright (C) 2007 admin@immerda.ch
# GPLv3

# modules_dir { "skeleton": }

class skeleton {
    case $operatingsystem {
        gentoo: { include skeleton::gentoo }
        default: { include skeleton::base }
    }
}

class skeleton::base {
    package{'skeleton':
        ensure => installed,
    }

    service{skeleton:
        ensure => running,
        enable => true,
        #hasstatus => true, #fixme!
        require => Package[skeleton],
    }

}

class skeleton::gentoo inherits skeleton::base {
    Package[skeleton]{
        category => 'some-category',
    }

    #conf.d file if needed
    # needs module gentoo
    #gentoo::etcconfd { skeleton: require => "Package[skeleton]", notify => "Service[skeleton]"}
}
