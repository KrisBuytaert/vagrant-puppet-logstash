class my-ribana{


  include passenger
  apache::vhost{'ribana':
    docroot      => '/var/vhosts/ribana/htdocs/static/',
    alias        => 'ribana',
    vhost_config => 'RackAutodetect On',

  }






}

