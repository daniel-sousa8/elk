#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'logstash_source' do
  command "echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list"
  user 'root'
  action :run
end

apt_update 'all_families' do
  action :update
end

apt_package 'logstash' do
  action :install
end

template '/etc/logstash/conf.d/02-beats-input.conf' do
  source '02-beats-input.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/logstash/conf.d/10-syslog-filter.conf' do
  source '10-syslog-filter.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

template '/etc/logstash/conf.d/30-elasticsearch-output.conf' do
  source '30-elasticsearch-output.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'logstash' do
  action [ :enable, :start ]
end
