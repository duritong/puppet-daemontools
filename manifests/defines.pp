# manifests/define.pp

# ensure can be running or stopped
define daemontools::service(
    $ensure = 'running',
    $source
){
    case $ensure {
        'running': { $real_ensure = $source }
        'stopped': { $real_ensure = 'absent' }
        default: { fail("no such modus for daemontools::service") }
    }
    file{"/service/${name$":
        ensure => $real_ensure,
    }
}
