ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("division")
require("employee")
require('pry')


RSpec.configure do |config|
  config.after(:each) do
    Division.all().each() do |division|
      division.destroy()
    end
  end
end
