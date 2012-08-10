node "elasticsearch" {

  yumrepo {



      "monitoringsucks":
        baseurl  => "http://pulp.inuits.eu/pulp/repos/monitoring/",
        descr    => "Monitoring Repo on Inuits.eu",
        gpgcheck => 0,
        enabled  => 1;


      #  "upstream":
      #  baseurl  => "http://pulp.inuits.eu/pulp/repos/monitoring/",
      #  descr    => "Upstream Packages from Inuits.eu repo",
      #  gpgcheck => 0,
      #  enabled  => 1;

  }

  service {"iptables":
    enable => false,
    ensure => stopped;
  }



  package { 'java-1.6.0-openjdk':
    ensure => 'installed';
  }

  #  package { 'tanukiwrapper':
  #  ensure => '3.5.7-1.jpp6',
  # }



  class {'elasticsearch::params':
    version        => '0.19.8-1.el6',
    es_clustername => 'mine',
  }
  class {'elasticsearch': }

  package {'elasticsearch-plugin-head':
    ensure => 'installed',
  }


}
