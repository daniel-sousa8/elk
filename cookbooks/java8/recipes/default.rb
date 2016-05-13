#
# Cookbook Name:: java8
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'add_java8_repo' do
  command 'add-apt-repository -y ppa:webupd8team/java'
  user 'root'
  action :run
end

apt_update 'all families' do
  action :update
end

execute 'accept_license' do
  command 'echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections; echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections'
  user 'root'
  action :run
end

apt_package 'oracle-java8-installer' do
  action :install
end
