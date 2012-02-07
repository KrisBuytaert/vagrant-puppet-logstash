node "logstash" {

  yumrepo {


    'inuits':
      baseurl => $operatingsystemrelease ? {
        '6.0' => 'http://repo.inuits.be/centos/6/os',
        '*' => 'http://repo.inuits.be/centos/5/os', },
        descr => $operatingsystemrelease ? {
          '6.0' => 'inuits internal CentOS 6.x repo',
          '*' => 'inuits internal CentOS 5.x repo' ,
        },
        gpgcheck => 0,
        enabled => 1;



      'inuits-gems':
        baseurl => 'http://repo.inuits.be/gems/',
        descr => 'Inuits Gems Repo',	
        gpgcheck => 0,
        enabled => 1;


      "jpackage-generic":
        baseurl => "http://mirrors.dotsrc.org/jpackage/5.0/generic/free/",
        descr      => "JPackage-generic",
        gpgcheck    => 0,
        enabled     => 1;

      "jpackage":
        baseurl => "http://mirrors.dotsrc.org/jpackage/5.0/redhat-el-5.0/free/",
        descr   => "Jpackage-el5",      
        gpgcheck => 0,  
        enabled         => 1;


      'epel':
        baseurl => $operatingsystemrelease ? {
          '6.0' => "http://mirror.eurid.eu/epel/6/$hardwaremodel/",
          '*' => "http://mirror.eurid.eu/epel/5/$hardwaremodel/",
        },
        descr => $operatingsystemrelease ? {
          '6.0' => 'Extra Packages for Enterprise Linux 6.x
          ',
          '*' => 'Extra Packages for Enterprise Linux 5.x',
        },
        gpgcheck => 0,
        enabled => 1;




  }

  service {"iptables":
    enable => false,
    ensure => stopped;
  }



  package { 'java-1.6.0-openjdk':
    ensure => 'installed';
  }

  package { 'tanukiwrapper':
    ensure => '3.5.7-1.jpp6',
   }



  class {'elasticsearch':
    version => '0.18.7-1.el6',
  }
  package {'elasticsearch-plugin-head':
    ensure => 'installed',
  }

  include rabbitmq
  include grok 
  include logstash::common 
  class {'logstash::shipper':
    verbose => 'yes',
  }

  class {'logstash::server':
    verbose => 'yes',
  }
  include logstash::web


  rsyslog::server {
    "default":
      servers => '127.0.0.1',
  }
}
