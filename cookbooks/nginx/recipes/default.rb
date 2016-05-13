#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package ['nginx', 'apache2-utils']  do
  action :install
end

execute 'create_kibana_user' do
  command 'htpasswd -c /etc/nginx/htpasswd.users kibanaadmin'
end

template '/etc/nginx/sites-available/default' do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'nginx' do
  action [ :enable, :start ]
end
