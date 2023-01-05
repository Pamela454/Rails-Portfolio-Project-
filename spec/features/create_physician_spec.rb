require 'rails_helper'

RSpec.describe 'Creating a physician user', type: :feature do
    scenario 'valid inputs' do
      visit users_new_physician_path
      fill_in 'Name', with: 'Dave'
      fill_in 'Email', with: 'dsmith@gmail.com'
      fill_in 'Password', with: 'HotSummer'
      fill_in 'Npi', with: '1234567891'
      fill_in 'Specialty', with: 'Family Medicine'
      click_on 'Create User'
      expect(page).to have_content('dsmith@gmail.com')
    end

    scenario 'invalid inputs' do
      visit users_new_physician_path
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'dsmith@gmail.com'
      fill_in 'Password', with: 'HotSummer'
      fill_in 'Npi', with: '1234567891'
      fill_in 'Specialty', with: 'Family Medicine'
      click_on 'Create User'
      expect(page).to have_content("Name can't be blank")
    end
  end