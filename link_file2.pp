file { '/root/satish.conf':
  ensure => '/bin/sathish.conf',
}

file { '/root/satish.conf':
  ensure => link,
  target => '/bin/sathish.conf',
}
