require 'rails_helper'

RSpec.describe 'Creating a patient user', type: :feature do
    scenario 'valid inputs' do
      visit users_new_patient_path
      fill_in 'Name', with: 'Linda'
      fill_in 'Email', with: 'lsmith@gmail.com'
      fill_in 'Password', with: 'SunnyDay'
      click_on 'Create User'
      visit user_path()
      expect(page).to have_content('lsmith@gmail.com')
    end
  end
  