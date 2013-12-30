#
# Cookbook Name:: selenium-grid
# Recipe:: hub
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "selenium-grid::base"

template "/etc/init.d/selenium-hub" do
  source "hub.initd.erb"
  mode "0755"
end

service "selenium-hub" do
  action [:start, :enable]
end
