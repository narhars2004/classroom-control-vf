class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')

  include ::apache
  apache::vhost { $::fqdn:
    port       => 80,
    docroot    => $docroot,
  }

  include ::apache::mod::php
}
