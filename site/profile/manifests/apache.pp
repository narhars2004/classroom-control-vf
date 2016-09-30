class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')

  class { 'apache':
    default_vhost => false,
  }
  include ::apache::mod::php
  apache::vhost { '127.0.0.1':
    port    => '80',
    docroot => '/var/www/html',
  }
}
