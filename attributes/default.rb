default['selenium-grid']['user'] = "selenium"
default['selenium-grid']['group'] = "selenium"
default['selenium-grid']['home'] = "/srv/selenium"
#default['selenium-grid']['logdir'] = "#{node['selenium-grid']['home']}/log"
default['selenium-grid']['logdir'] = "/var/log/selenium"

default['selenium-grid']['version'] = "2.35.0"
default['selenium-grid']['server-jar'] = "selenium-server-standalone-#{node['selenium-grid']['version']}.jar"
default['selenium-grid']['server-jar-url'] = "https://selenium.googlecode.com/files/#{node['selenium-grid']['server-jar']}"

default['selenium-grid']['chromedriver']['architecture'] = "linux64"
default['selenium-grid']['chromedriver']['version'] = "2.3"

default['selenium-grid']['firefox']['instances'] = "3"
default['selenium-grid']['firefox']['version'] = "23.0.1"
