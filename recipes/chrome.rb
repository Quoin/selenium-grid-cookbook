#
# Cookbook Name:: selenium-grid
# Recipe:: chrome
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "selenium-grid::base"
include_recipe "selenium-grid::chromedriver"

package "chromium-browser"

template "/etc/init.d/selenium-chrome" do
  source "chrome.initd.erb"
  mode "0755"
end

service "selenium-chrome" do
  action [:restart, :enable]
end
