require 'capybara'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.current_driver = :poltergeist
Capybara.app_host = 'http://localhost:8181'

RSpec.configure do |configuration|
  configuration.include Capybara::DSL
end