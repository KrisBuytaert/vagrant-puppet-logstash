node /logstash/ {

  service {"iptables":
    enable => false,
    ensure => stopped;
  }
  include my-repos
  include my-logstash
}
