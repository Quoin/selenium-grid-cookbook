require 'open-uri'

def latest_chrome_driver
  result = open('http://chromedriver.storage.googleapis.com/LATEST_RELEASE').read
end


default['selenium-grid']['user'] = "selenium"
default['selenium-grid']['group'] = "selenium"
default['selenium-grid']['home'] = "/srv/selenium"
#default['selenium-grid']['logdir'] = "#{node['selenium-grid']['home']}/log"
default['selenium-grid']['logdir'] = "/var/log/selenium"

default['selenium-grid']['version'] = "2.39.0"
default['selenium-grid']['server-jar'] = "selenium-server-standalone-#{node['selenium-grid']['version']}.jar"
default['selenium-grid']['server-jar-url'] = "https://selenium.googlecode.com/files/#{node['selenium-grid']['server-jar']}"

default['selenium-grid']['hub']['host'] = "localhost"
default['selenium-grid']['hub']['port'] = "4444"
default['selenium-grid']['hub']['url'] = "http://#{node['selenium-grid']['hub']['host']}:#{node['selenium-grid']['hub']['port']}"

default['selenium-grid']['firefox']['port'] = "5555"
default['selenium-grid']['chrome']['port'] = "5556"

default['selenium-grid']['chromedriver']['architecture'] = "linux64"
default['selenium-grid']['chromedriver']['version'] = latest_chrome_driver
default['selenium-grid']['chromedriver']['driver-zip'] = "chromedriver_#{node['selenium-grid']['chromedriver']['architecture']}.zip"
default['selenium-grid']['chromedriver']['driver-zip-url'] = "http://chromedriver.storage.googleapis.com/#{node['selenium-grid']['chromedriver']['version']}/#{node['selenium-grid']['chromedriver']['driver-zip']}"


default['selenium-grid']['chrome']['instances'] = "3"
default['selenium-grid']['chrome']['version'] = "28.0.1500.71" #TODO: The version is currently not meaningful!

default['selenium-grid']['firefox']['instances'] = "3"
default['selenium-grid']['firefox']['version'] = "23.0.1" #TODO: The version is currently not meaningful!