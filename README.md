Selenium Grid Cookbook
=================

Deploys a grid installation of Selenium. One instance of Selenium acts as the hub which listens for Selenium requests and routs them to a grid of registered Selenium nodes. This cookbook supports Firefox and Chromium deploys to a Debianoid system. By default, the hub and the Firefox and Chromium nodes are deployed to the same target machine, which happends to be localhost (or a Vagrant target). Look at the attributes file: selenium-grid-cookbook/attributes.default.rb for further details and overide these in environment configuration files.


TODO:

* This has been tested on a target Vagrant box but not on an arbitrary grid configuration deploy.
* The deployed Firefox version is not being set via this cookbook.
* The deployed Chrome version is not being set via this cookbook.
