
define rsyslog::server($servers = "",$rule = "",
			$local2 = "",
			$local3 = "",
			$local4 = "",
			$local5 = "",
			$local6 = "",
			$local7 = "",
			$hostname = "") {

	service {
		"rsyslog":
			ensure => $ensure_service,
			enable => true;
	}

	package {
		"rsyslog":
			ensure => "installed";
	}
	
	file {
		"/etc/rsyslog.conf":
			owner   => "root",
			group   => "root",
			mode    => "0644",
			content => template("rsyslog/rsyslog.conf.erb"),
			ensure  => "present",
			alias   => "rsyslog.conf",
			notify  => Service["rsyslog"];
	}
}
