class profile::wordpress {
  #  $domain = hiera('profile::wordpress::domain', '54.218.5.21')

  class { 'wordpress':
    install_dir    => '/var/www/html',
    wp_multisite   => false,
    #wp_site_domain => $domain,
    wp_siteurl     => 'http://54.218.5.21/port/4004',
  }
}
