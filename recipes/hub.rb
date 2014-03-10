#
# Cookbook Name:: selenium-grid
# Recipe:: hub
#
# Copyright 2013, Quoin Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe "selenium-grid::base"

selenium_service :hub
