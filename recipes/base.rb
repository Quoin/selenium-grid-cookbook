#
# Cookbook Name:: selenium-grid
# Recipe:: base
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "quoin::force_apt_get_update"
include_recipe "java"
include_recipe "xvfb"
include_recipe "x11vnc"

package "daemon"


group node['selenium-grid']['group']
user node['selenium-grid']['user'] do
  home node['selenium-grid']['home']
  gid node['selenium-grid']['group']
  system true
  shell "/bin/bash"
end

directory node['selenium-grid']['home'] do
  user node['selenium-grid']['user']
  group node['selenium-grid']['group']
  mode "0755"
end

directory node['selenium-grid']['logdir'] do
  user node['selenium-grid']['user']
  group node['selenium-grid']['group']
  mode "0755"
end

remote_file "#{node['selenium-grid']['home']}/#{node['selenium-grid']['server-jar']}" do
  source node['selenium-grid']['server-jar-url']
  owner node['selenium-grid']['user']
  group node['selenium-grid']['group']
  mode "0755"
  action :create_if_missing
end
