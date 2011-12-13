# Class: elasticsearch
#
# This module manages elasticsearch
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class elasticsearch {

	package {
		"elasticsearch":
			ensure => "present";

# Tanuki not needed for elastic as it is cleanlyh packaged now 
#		"tanukiwrapper":
#			ensure => "present";
	}

#	file {
#		"/usr/local/elasticsearch-0.16.0/bin/elasticsearch.conf":
#				owner => "root",
#				group => "root",
#				ensure => "present",
#				source => "puppet:///modules/elasticsearch/elasticsearch.conf";
#		"/etc/init.d/elasticsearch":
#			   	owner => "root",
#                                group => "root",
#                                ensure => "present"	,
#				mode => "0755", 
#                                source => "puppet:///modules/elasticsearch/elasticsearch"; 
#	}
	

}

