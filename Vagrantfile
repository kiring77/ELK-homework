Vagrant.configure("2") do |config|

 config.vm.box = "sbeliakou/centos"
 config.vbguest.auto_update = false

 config.vm.define "tomcat_logstash" do |tomcat_logstash|
         tomcat_logstash.vm.network "private_network", ip: "192.168.10.10"
         tomcat_logstash.vm.hostname = "tomcat"
         tomcat_logstash.vm.provider "virtualbox" do |vb|
                vb.name = "tomcat_logstash"
                vb.memory = "2048"
            end
         config.vm.provision "shell", path: "tomcat_logstash.sh"
      end


config.vm.define "elastic_kibana" do |elastic_kibana|
         elastic_kibana.vm.network "private_network", ip: "192.168.10.20"
         elastic_kibana.vm.hostname = "elastic"
         elastic_kibana.vm.provider "virtualbox" do |vb|
                vb.name = "elastic_kibana"
                vb.memory = "4096"
            end
         config.vm.provision "shell", path: "elastic_kibana.sh"
     end
end

