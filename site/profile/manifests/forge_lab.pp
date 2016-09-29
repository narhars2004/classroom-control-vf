class profile::forge_lab {
  $redis_password = hiera('profile::redis_password', 'default_password')

  sysctl { "net.ipv4.ip_forward":
    ensure => present,
    value  => "1",
    target => "/etc/sysctl.d/forwarding.conf",
  }

  include epel
  class { 'limits': }
   limits::limits { 'fundamentals_nofile':
    ensure     => present,
    user       => 'fundamentals',
    limit_type => 'nofile',
    hard       => 16384,
    soft       => 16384,
  }

  class { 'redis':
    bind       => $::ipaddress,
    masterauth => $redis_password,
    require    => Class['epel'],
  }
}
