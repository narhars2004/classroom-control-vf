class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')
  
  apache::vhost { $::fqdn:
    port       => 80,
    docroot    => $docroot,
    mpm_module => 'prefork',
  }

  include ::apache::mod::php
}
