#This module will manage nginx parameters 
# class: nginx::params
#
class nginx::params {
  $nginx_conf_dir = '/etc/nginx'
  $nginx_worker_processes = 1
  $nginx_worker_connections = 1024
  $nginx_multi_accept = off
  $nginx_sendfile = on
  $nginx_keepalive_timeout = 65
  $nginx_tcp_nodelay = off
  $nginx_tcp_nopush = on
  $nginx_gzip = on
  $nginx_logdir = $::kernel ? {
    /(?i-mx:linux)/ => '/var/log/nginx',
  }

  $nginx_pid = $::kernel ? {
    /(?i-mx:linux)/ => '/var/run/nginx.pid',
  }

  $nginx_daemon_user = $::operatingsystem ? {
    /(?i-mx:debian|ubuntu)/                    => 'www-data',
    /(?i-mx:fedora|rhel|centos|suse|opensuse)/ => 'nginx',
  }
}
