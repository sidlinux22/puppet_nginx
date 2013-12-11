class nginx::package::redhat {
  $packages = ['nginx']
  package { $packages:
    ensure => installed,
  }
}
