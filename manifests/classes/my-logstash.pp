class my-logstash{
# This class installs logstash and all its dependencies 



include ::apache

apache::vhost{'kibana':
  serveraliases => 'logstash';
}

rsyslog::server {"master": }



package { 'java-1.6.0-openjdk':
  ensure => 'installed';
}


package { 'tanukiwrapper':
  ensure => '3.5.7-1.jpp6',
}


package {'php':
  ensure => 'installed';
}


class {'elasticsearch::params':
  version => '0.18.7-1.el6',
}
include elasticsearch
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

service {"httpd":  ensure => running; }
include kibana


}

