node "logstash" {

	yumrepo {
	


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

	include logstash::simple


}

