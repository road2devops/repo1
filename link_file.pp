file { '/etc/inetd.conf':
  ensure => '/etc/inet/inetd.conf',
}

file { '/etc/inetd.conf':
  ensure => link,
  target => '/etc/inet/inetd.conf',
}
