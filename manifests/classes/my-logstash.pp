class my-logstash{
# This class installs logstash and all its dependencies 



include ::apache

apache::vhost{'kibana':
  serveraliases => 'logstash';
}


class {'rsyslog':
}


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
  version => '0.19.10-1.el6',
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

# Not running web when we are running kibana
#include logstash::web
include kibana


}

