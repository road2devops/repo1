file { '/root/just_sati5':
  ensure => '/bin/just_sati_target',
}

file { '/root/just_sati5':
  ensure => link,
  target => '/bin/just_sati_target',
}
