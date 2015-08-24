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

  describe('viewing all the employees in a division') do
    it('allows a user to view the employees that belong to a specific division') do
      division = Division.create({:name => 'Marketing', :id => nil})
      visit('/')
      fill_in('name', :with => 'HR')
      click_button('Add Division')
      click_link(division.name)
      expect(page).to have_content(division.name())
    end
  end

end
