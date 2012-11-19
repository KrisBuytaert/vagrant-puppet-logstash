class my-repos{


  yumrepo { 'rubygems':
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/rubygems',
    descr      => 'RubyGems at Inuits',
    gpgcheck   => '0',
  }

  yumrepo { 'monitoringsucks':
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/monitoring',
    descr      => 'MonitoringSuck at Inuits',
    gpgcheck   => '0',
  }
  yumrepo {'epel':
    baseurl    => 'http://pulp.inuits.eu/pulp/repos/epel/6/x86_64/',
    descr      => 'Epel Repo at Inuits',
    gpgcheck   => '0',
  }
  yumrepo {'stealthmonkeys':
    baseurl          => 'https://pulp.inuits.eu/pulp/repos/rhel/6/x86_64/',
    descr        => 'Stealthmonkeys at Inuits',
    gpgcheck => '0',
  }


}
