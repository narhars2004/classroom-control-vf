class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')

  include ::apache
  apache::vhost { $::fqdn:
    port       => 80,
    docroot    => $docroot,
    mpm_module => 'prefork',
  }

  include ::apache::mod::php
}
