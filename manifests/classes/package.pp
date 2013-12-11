#Manage ngnix package installation 
# class: nginx::package



class nginx::package {
  case $::operatingsystem {
    centos,fedora,rhel: {
      class {'nginx::package::redhat': }
    }
    debian, ubuntu: {
      class {'nginx::package::debian': }
    }
  }
}
