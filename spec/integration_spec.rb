require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe('employee_tracker app',{:type => :feature}) do

  describe('adding a new division') do
    it('allows a user to add a new division') do
      visit('/')
      fill_in('name', :with => 'Marketing')
      click_button('Add Division')
      expect(page).to have_content('Welcome to the Employee Tracker')
    end
  end

end
