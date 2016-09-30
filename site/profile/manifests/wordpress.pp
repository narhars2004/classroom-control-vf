class profile::wordpress {
  #  $domain = hiera('profile::wordpress::domain', '54.218.5.21')

  class { 'wordpress':
    install_dir    => '/opt/wordpress',
    #  wp_multisite   => true,
    #wp_site_domain => $domain,
  }
}
