#!/bin/bash

#Java
#sudo yum install -y java-1.8.0-openjdk-devel
#Tomcat
sudo yum install -y tomcat tomcat-webapps
sudo chown -R tomcat:tomcat /var/lib/tomcat
chmod -R 755 /usr/share/tomcat/logs/
sudo systemctl enable tomcat
sudo systemctl start tomcat

#Logstash
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cat <<EOF > /etc/yum.repos.d/logstash.repo
[logstash-7.x]
name=Elastic repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF

sudo yum install -y logstash
cp -f /vagrant/logstash.conf /etc/logstash/conf.d/
sudo systemctl daemon-reload
sudo systemctl enable logstash
sudo systemctl start logstash
