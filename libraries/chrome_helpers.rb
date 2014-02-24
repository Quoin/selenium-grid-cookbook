require 'open-uri'

module Chrome
  module Helpers
    def latest_chrome_driver
      result = open('http://chromedriver.storage.googleapis.com/LATEST_RELEASE').read ||= node['selenium-grid']['chromedriver']['version']
    end

    def drive_zip_url
      return "http://chromedriver.storage.googleapis.com/#{latest_chrome_driver}/#{node['selenium-grid']['chromedriver']['driver-zip']}"
    end
  end
end