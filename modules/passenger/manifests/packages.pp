# == Class: passenger::packages
#
# Description of passenger::packages
#
# === Parameters:
#
# === Actions:
#
# === Requires:
#
# === Sample Usage:
#
class passenger::packages {

  # require apache
  # require apache::params

  #@todo: backport old compatibility

  require passenger::params

  package { $passenger::params::package:
    ensure   => 'installed',
    require  => Package[$passenger::params::required_packages],
  }

  if $passenger::params::version != undef {
    Package[$passenger::params::package] {
      ensure => $passenger::params::version
    }
  }

}
