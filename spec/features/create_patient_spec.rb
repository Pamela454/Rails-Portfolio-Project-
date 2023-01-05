require 'rails_helper'

RSpec.describe 'Creating a patient user', type: :feature do
    scenario 'valid inputs' do
      visit users_new_patient_path
      fill_in 'Name', with: 'Linda'
      fill_in 'Email', with: 'lsmith@gmail.com'
      fill_in 'Password', with: 'SunnyDay'
      click_on 'Create User'
      expect(page).to have_content('lsmith@gmail.com')
    end

    scenario 'invalid name input' do
      visit users_new_patient_path
      fill_in 'Name', with: ''
      fill_in 'Email', with: 'lsmith@gmail.com'
      fill_in 'Password', with: 'SunnyDay'
      click_on 'Create User'
      expect(page).to have_content("Name can't be blank")
    end

    scenario 'invalid email input' do
      visit users_new_patient_path
      fill_in 'Name', with: 'Linda'
      fill_in 'Email', with: ''
      fill_in 'Password', with: 'SunnyDay'
      click_on 'Create User'
      expect(page).to have_content("Email can't be blank")
    end

    scenario 'invalid password input' do
      visit users_new_patient_path
      fill_in 'Name', with: 'Linda'
      fill_in 'Email', with: 'lsmith@gmail.com'
      fill_in 'Password', with: ''
      click_on 'Create User'
      expect(page).to have_content("Password can't be blank")
    end
  end
  