# == Class: passenger::params
#
# Description of passenger::params
#
# === Parameters:
#
# @todo: http://www.modrails.com/documentation/Users%20guide%20Apache.html
#
# === Actions:
#
# === Requires:
#
# === Sample Usage:
#
class passenger::params (
  $packages              = undef,
  $configpath            = undef,
  $version               = undef,
  $template              = 'passenger/passenger.conf.erb',
  $passenger_root        = '',
  $passenger_ruby        = '',
  $app_root              = '',
  $spawn_method          = '',
  $use_global_queue      = true,
  $passenger_enabled     = true,
  $temp_dir              = '',
  $upload_buffer_dir     = '',
  $restart_dir           = '',
  $buffer_response       = true,
  $user_switching        = true,
  $user                  = '',
  $group                 = '',
  $default_user          = '',
  $default_group         = '',
  $friendly_error_pages  = true,
  $max_pool_size         = '',
  $min_instances         = '',
  $max_instances_per_app = '',
  $pool_idle_time        = '',
  $max_requests          = '',
  $stat_throttle_rate    = '',
  $pre_start             = '',
  $high_performance      = false,
  $log_level             = '',
  $debug_logfile         = ''
#  $rails_autodetect      = true,             ## @todo: Having some issues
#                                             ## with arrays and detecting them.
#  $rails_baseuri         = [],
#  $rails_env             = [],
#  $rack_autodetect       = true,
#  $rack_baseuri          = [],
#  $rack_env              = [],
){

## @todo: high_performance -> no mod_rewrite!

  ## Copy paste snippets:
  # template("${module_name}/template.erb")
  # source => "puppet:///modules/${module_name}/file"

  ## Global parameters, module independent.
  $package = $packages ? {
    default => $packages,
    undef   => $::operatingsystem? {
      /(?i:centos|redhat)/ => ['rubygem-passenger',  'mod_passenger'],
      default              => [],
    }
  }

  ## Apache integration
  if defined('::apache::module') {
    require apache::module
    debug("O Hi! I detected that you using a (pluggeable?) apache module (${apache::module::id}). Trying to work with it!")
    case $apache::module::id {
      default, undef: {
        fail("The selected module (${apache::module::id}) is not supported by this module.")
      }
      'inuits-puppet-apache': {
        require apache::params
        $conf_file = "${apache::params::confd}/passenger-config.conf"
        $required_packages = [ $apache::params::package ]
        $notify_services = [ $apache::params::service_name ]
      }
    }

  }
  else {
    $conf_file = $::operatingsystem ? {
      /(?i:archlinux)/     => '/etc/httpd/conf/extra/passenger.conf',
      /(?i:centos|redhat)/ => '/etc/httpd/conf.d/passenger.conf',
      /(?i:debian|ubuntu)/ => '/etc/apache2/conf.d/passenger.conf',
    }
    $required_packages = [ $packages ]
    $notify_services = [ 'apache' ]
  }

}

