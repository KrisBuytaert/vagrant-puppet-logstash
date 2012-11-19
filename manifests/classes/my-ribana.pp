class my-ribana{


  class {'passenger': }
  class {'kibana-ruby': }
  apache::vhost{'ribana':
    docroot      => '/var/vhosts/ribana/htdocs/static/',
    alias        => 'ribana',
    vhost_config => 'RackAutodetect On',

  }






}

