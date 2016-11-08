$ntp_conf = @(end)
server in.pool.ntp.org iburst prefer
driftfile /var/lib/ntp/drift
end
case $facts['os'] ['family'] {
'Redhat' : {
$ntp_service = 'ntpd'
$admingroup = 'root'
}
'Debian' : {
$ntp_service = 'ntp'
$admingroup = 'root'
}
defalut : {
fail ("your ${facts['os'] ['family']} is not supported")
}
}
Package { 'ntp' :
before => File['/etc/ntp.conf'],
}
File {
ensure => 'file',
owner  => 'root',
group  => 'root',
mode   => '0777',}
file {'/etc/ntp.conf' :
content => $ntp_conf,
notify => Service['ntp_service'],
}
Service {'ntp_service' :
ensure => 'running',
enable => true,
name   => $ntp_service,
subscribe => File['/etc/ntp.conf'],
}
