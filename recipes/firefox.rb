#
# Cookbook Name:: selenium-grid
# Recipe:: firefox-node
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#


include_recipe "firefox"
include_recipe "selenium-grid::base"

template "/etc/init.d/selenium-firefox" do
  source "firefox.initd.erb"
  mode "0755"
end

service "selenium-firefox" do
  action [:stop, :start, :enable]
end
