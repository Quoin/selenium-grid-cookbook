#
# Cookbook Name:: selenium
# Recipe:: chromedriver
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

package "unzip" do
  action :install
end

package "libgconf2-4" do
  action :install
end

remote_file File.join(Chef::Config[:file_cache_path], "chromedriver_#{node[:selenium][:chromedriver][:architecture]}_#{node[:selenium][:chromedriver][:version]}.zip") do
  source "http://chromedriver.googlecode.com/files/chromedriver_#{node[:selenium][:chromedriver][:architecture]}_#{node[:selenium][:chromedriver][:version]}.zip"
  action :create_if_missing
end

execute "unpack chromedriver" do
  command "unzip -o -x chromedriver_#{node[:selenium][:chromedriver][:architecture]}_#{node[:selenium][:chromedriver][:version]}.zip -d /usr/local/selenium/"
  cwd File.join(Chef::Config[:file_cache_path])
end

file "/usr/local/selenium/chromedriver" do
  owner "quoin"
  group "quoin"
  mode "0755"
end

template "/etc/init.d/chromedriver" do
  source "chromedriver.initd.erb"
  owner "quoin"
  group "quoin"
  mode "0755"
end

service "chromedriver" do
  action [:restart, :enable]
end
