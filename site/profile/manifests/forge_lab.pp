class profile::forge_lab {
  $redis_password = hiera('profile::redis_password', 'default_password')

  sysctl { "kernel.sysrq":
    ensure    => present,
    comment => "This is a comment from Profile::forge_lab",
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
