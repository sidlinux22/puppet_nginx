#Module manages the nginx service 
#class: nginx::manage_service



class nginx::manage_service {
  Exec['compile-nginx-config'] -> Service['nginx']
  exec { 'compile-nginx-config':
    command     => "/bin/cat ${nginx::nginx_conf_dir_real}/conf.d/.frag* > ${nginx::nginx_conf_dir_real}/conf.d/generated.conf",
    #onlyif => "",
    refreshonly => true,
  }
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }
}
