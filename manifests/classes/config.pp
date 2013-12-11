# Manages ngnix configuration 
# class: nginx::config
class nginx::config {
  File {
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    notify => Class['nginx::manage_service']
  }
  file { "${nginx::nginx_conf_dir_real}":
    ensure => directory
  }
  file { "${nginx::nginx_conf_dir_real}/conf.d":
    ensure => directory
  }
  file { "${nginx::nginx_conf_dir_real}/nginx.conf":
    ensure  => file,
    content => template("/etc/puppet/template/nginx.conf.erb")
  }
  }
