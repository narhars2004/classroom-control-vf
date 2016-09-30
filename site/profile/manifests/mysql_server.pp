class profile::mysql_server {
  $sql_password = hiera('profile::sql_password', 'strongpassword')

  class { '::mysql::server':
    root_password => $sql_password,
  }
  include mysql::bindings::php

}
