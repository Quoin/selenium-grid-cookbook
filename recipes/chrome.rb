#
# Cookbook Name:: selenium
# Recipe:: chrome
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "selenium::base"
include_recipe "selenium::chromedriver"

package "chromium-browser" do
  action :install
end

template "/etc/init.d/selenium-chrome" do
  source "chrome.initd.erb"
  owner "quoin"
  group "quoin"
  mode "0755"
end

service "selenium-chrome" do
  action [:restart, :enable]
end
