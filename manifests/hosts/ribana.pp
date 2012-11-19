node /ribana/ {

  service {"iptables":
    enable => false,
    ensure => stopped;
  }
  include my-repos
  include my-ribana
}
