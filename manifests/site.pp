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
          



	}


	notify { " yeah ": } 


     	package { 'java-1.6.0-openjdk':
                                       ensure => 'installed';
                }




	include logstash::server


}

