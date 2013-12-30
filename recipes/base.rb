#
# Cookbook Name:: selenium
# Recipe:: base
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "xvfb"
include_recipe "x11vnc"


package "daemon" do
  action :install
end

directory "/usr/local/selenium/" do
  user "quoin"
  group "quoin"
  mode "0755"
end

directory "/var/log/selenium" do
  user "quoin"
  group "quoin"
  mode "0755"
end

remote_file File.join(Chef::Config[:file_cache_path], "selenium-server-standalone-#{node[:selenium][:version]}.jar") do
  source "https://selenium.googlecode.com/files/selenium-server-standalone-#{node[:selenium][:version]}.jar"
  action :create_if_missing
end

execute "copy selenium" do
  command "cp selenium-server-standalone-#{node[:selenium][:version]}.jar /usr/local/selenium/"
  cwd File.join(Chef::Config[:file_cache_path])
end

file File.join("/usr/local/selenium", "selenium-server-standalone-#{node[:selenium][:version]}.jar") do
  owner "quoin"
  group "quoin"
  mode "0755"
end
