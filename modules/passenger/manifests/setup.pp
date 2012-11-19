# = Class: passenger::setup
#
# Setup / configure passenger
#
# == Actions:
#
# Puts the passenger configuration file in place.
# This does NOT replace the configuration file that was packages,
# but rathers adds a configuration file for configuration.
#
#
# == Requires:
#
# == Sample Usage:
#
class passenger::setup {
  ## Copy paste snippets:
  # template("${module_name}/template.erb")
  # source => "puppet:///modules/${module_name}/file"

  require passenger::params

  $config_file = $passenger::params::conf_file
  $template = $passenger::params::template
  $notify_services = $passenger::params::notify_services
  ## @todo: Put the passenger.conf in his place

  file {$config_file:
    ensure  => 'present',
    content => template($template),
    mode    => '0644',
    notify  => Service[$notify_services],
  }

}

