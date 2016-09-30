class profile::apache {
  $docroot = hiera('profile::apache::docroot', '/opt/wordpress')

  include ::apache
  include ::apache::mod::php
}
