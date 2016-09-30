class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')
  
  apache::vhost { $::fqdn:
    port            => 80,
    docroot         => $docroot,
  }

  include ::apache::mod::php
  include ::apache::mod::prefork
}
