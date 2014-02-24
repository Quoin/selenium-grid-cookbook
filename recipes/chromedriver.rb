#
# Cookbook Name:: selenium-grid
# Recipe:: chromedriver
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

package "unzip"
package "libgconf2-4"

remote_file "#{Chef::Config[:file_cache_path]}/#{node['selenium-grid']['chromedriver']['driver-zip']}" do
  extend Chrome::Helpers
  source drive_zip_url
  action :create_if_missing
end

execute "unpack chromedriver" do
  command "unzip -o -x #{node['selenium-grid']['chromedriver']['driver-zip']} -d #{node['selenium-grid']['home']}"
  cwd Chef::Config[:file_cache_path]
end

file "#{node['selenium-grid']['home']}/chromedriver" do
  owner node['selenium-grid']['user']
  group node['selenium-grid']['group']
  mode "0755"
end

template "/etc/init.d/chromedriver" do
  source "chromedriver.initd.erb"
  mode "0755"
end

service "chromedriver" do
  action [:restart, :enable]
end
