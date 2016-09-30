class role::capstone {
  include ::profile::mysql_server
  include ::profile::apache
  include ::profile::wordpress
}
