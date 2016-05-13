#
# Cookbook Name:: kibana
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'install_kibana' do
  command 'echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | tee -a /etc/apt/sources.list.d/kibana-4.4.x.list'
  action :run
end

apt_update 'all families' do
  action :update
end

apt_package 'kibana' do
  action :install
end

execute 'localhost_only_ES' do
  command 'echo "server.host: "localhost"" >  /opt/kibana/config/kibana.yml'
  user 'root'
  action :run
end

service 'kibana' do
  action [ :enable, :start ]
end
