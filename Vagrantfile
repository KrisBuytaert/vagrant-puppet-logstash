Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define :default do |default_config|
       default_config.vm.box = "Centos6"
       default_config.vm.network  :hostonly, "10.42.42.51"
       default_config.ssh.max_tries = 100
       default_config.vm.host_name = "logstash"
       default_config.vm.forward_port  80, 8080
       default_config.vm.provision :puppet do |default_puppet|
       		default_puppet.pp_path = "/tmp/vagrant-puppet"
       		default_puppet.manifests_path = "manifests"
       		default_puppet.module_path = "modules"
       		default_puppet.manifest_file = "site.pp"
       end
  end
  config.vm.define :elasticsearch do |elasticsearch_config|
       elasticsearch_config.vm.box = "Centos6"
       elasticsearch_config.ssh.max_tries = 100
       elasticsearch_config.vm.host_name = "elasticsearch"
       elasticsearch_config.vm.network  :hostonly, "10.42.44.3"
       elasticsearch_config.vm.provision :puppet do |elasticsearch_puppet|
       		elasticsearch_puppet.pp_path = "/tmp/vagrant-puppet"
       		elasticsearch_puppet.manifests_path = "manifests"
       		elasticsearch_puppet.module_path = "modules"
       		elasticsearch_puppet.manifest_file = "site.pp"
       end
  end
  config.vm.define :logstash2 do |logstash2_config|
       logstash2_config.vm.box = "Centos6"
       logstash2_config.ssh.max_tries = 100
       logstash2_config.vm.host_name = "logstash2"
       logstash2_config.vm.network  :hostonly, "10.42.44.3"
       logstash2_config.vm.provision :puppet do |logstash2_puppet|
            logstash2_puppet.pp_path = "/tmp/vagrant-puppet"
            logstash2_puppet.manifests_path = "manifests"
            logstash2_puppet.module_path = "modules"
            logstash2_puppet.manifest_file = "site.pp"
       end
  end
end
