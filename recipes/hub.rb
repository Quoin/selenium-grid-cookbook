#
# Cookbook Name:: selenium
# Recipe:: hub
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "selenium::base"

template "/etc/init.d/selenium-hub" do
  source "hub.initd.erb"
  owner "quoin"
  group "quoin"
  mode "0755"
end

service "selenium-hub" do
  action [:start, :enable]
end
