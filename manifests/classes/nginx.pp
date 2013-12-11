# This  module Manages  nginx  | ALL the parameters are managed via nginx::params class
# Class: nginx

class nginx (
  $nginx_conf_dir = 'UNSET',
  $nginx_worker_processes = 'UNSET',
  $nginx_worker_connections = 'UNSET',
  $nginx_multi_accept = 'UNSET',
  $nginx_sendfile = 'UNSET',
  $nginx_keepalive_timeout = 'UNSET',
  $nginx_tcp_nodelay = 'UNSET',
  $nginx_gzip = 'UNSET',
  $nginx_logdir = 'UNSET',
  $nginx_pid = 'UNSET',
  $nginx_daemon_user = 'UNSET'
)
{
  include nginx::params

  $nginx_conf_dir_real = $nginx_conf_dir ? {
    'UNSET' => $::nginx::params::nginx_conf_dir,
    default => $nginx_conf_dir,
  }

  $nginx_worker_processes_real = $nginx_worker_processes ? {
    'UNSET' => $::nginx::params::nginx_worker_processes,
    default => $nginx_worker_processes,
  }

  $nginx_worker_connections_real = $nginx_worker_connections ? {
    'UNSET' => $::nginx::params::nginx_worker_connections,
    default => $nginx_worker_connections,
  }

  $nginx_multi_accept_real = $nginx_multi_accept ? {
    'UNSET' => $::nginx::params::nx_multi_accept,
    default => $nx_multi_accept,
  }

  $nginx_sendfile_real = $nginx_sendfile ? {
    'UNSET' => $::nginx::params::nginx_sendfile,
    default => $nginx_sendfile,
  }

  $nginx_keepalive_timeout_real = $nginx_keepalive_timeout ? {
    'UNSET' => $::nginx::params::nx_keepalive_timeout,
    default => $nginx_keepalive_timeout,
  }

  $nginx_tcp_nodelay_real = $nginx_tcp_nodelay ? {
    'UNSET' => $::nginx::params::nx_tcp_nodelay,
    default => $nginx_tcp_nodelay,
  }

  $nginx_gzip_real = $nginx_gzip ? {
    'UNSET' => $::nginx::params::nx_gzip,
    default => $nx_gzip,
  }

  $nginx_logdir_real = $nx_logdir ? {
    'UNSET' => $::nginx::params::nx_logdir,
    default => $nx_logdir,
  }

  $nginx_pid_real = $nx_pid ? {
    'UNSET' => $::nginx::params::nx_pid,
    default => $nx_pid,
  }

  $nginx_daemon_user_real = $nx_daemon_user ? {
    'UNSET' => $::nginx::params::nx_daemon_user,
    default => $nx_daemon_user,
  }


  class { 'nginx::package': }
  class { 'nginx::manage_service': }
  class { 'nginx::config': }
  Class['nginx::package'] -> Class['nginx::config'] -> Class['nginx::manage_service']
}
