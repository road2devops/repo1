file {'/root/temp.txt'
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0777',
  content => 'This is puppet conent'
}
