class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')

  class { 'apache':
    default_vhost => false,
  }
  include ::apache::mod::php
  apache::listen { '80': }
}
