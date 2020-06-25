# frozen_string_literal: true

require 'base64'
require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'selenium-webdriver'

CONFIG = ENV['ENV_TYPE']
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV['ENV_TYPE']}.yaml"))

case ENV['BROWSER']
when 'firefox'
  @driver = :selenium
when 'chrome'
  @driver = :selenium_chrome
when 'headless'
  @driver = :selenium_chrome_headless
else
  puts 'Invalid Browser'
end

Capybara.configure do |config|
  config.default_driver = @driver
  # config.app_host = 'https://www.webmotors.com.br'
  config.app_host = CONFIG['url']
  config.default_max_wait_time = 5
end
