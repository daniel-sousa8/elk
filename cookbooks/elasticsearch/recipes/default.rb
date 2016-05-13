#
# Cookbook Name:: elasticsearch
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'adding_elastic_key' do
  command 'wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -'
  user 'root'
  action :run
end

execute 'create_elastic_source_list' do
  command 'echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list'
  user 'root'
  action :run
end

apt_update 'all families' do
  action :update
end

apt_package 'elasticsearch' do
  action :install
end

execute 'localhost_only_ES' do
  command 'echo "network.host: localhost" >  /etc/elasticsearch/elasticsearch.yml'
  user 'root'
  action :run
end

service 'elasticsearch' do
  action [ :enable, :start ]
end
