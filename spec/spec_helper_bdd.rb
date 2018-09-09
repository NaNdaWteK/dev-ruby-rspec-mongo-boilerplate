require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'yaml'

Capybara.default_max_wait_time=2

def host_ip
  routes = `/sbin/ip route`
  routes.match(/[\d\.]+/)
end

def env
  YAML.load(File.read("./environment.yml"))
end

def use_selenium
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, {
      browser: :remote,
      url: 'http://chrome:4444/wd/hub',
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome
    })
  end
  Capybara.default_driver = :chrome
  Capybara.app_host = "http://#{host_ip}:#{env['port']}"
end

def use_chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  Capybara.default_driver = :chrome
  Capybara.app_host = "http://localhost:#{env['port']}"
end

if (env['mode'] == 'development')
  use_selenium
else
  use_chrome
end
