# Class: grok
#
# This module manages grok
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
class grok {


	package {
		"grok":
			ensure => installed;
		"rubygem-cabin":
			ensure => installed;
		"rubygem-jls-grok":
			ensure => installed;
		
	}

}
