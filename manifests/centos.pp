class daemontools::centos inherits daemontools::base {
  # start svscan, it is added to the inittab by the rpm
  # but not started
  exec{'svscanboot &':
    unless => 'ps ax | grep -v grep | grep -q svscan',
    require => Package['daemontools'],
  }
}
