require 'rails_helper'

RSpec.describe 'Edit physician user', type: :feature do
    #create physician user
    #visit user path
    #click on edit profile
    #fill out form
    #click submit
    #check for changes on user page

    scenario 'valid inputs' do
        @physician = create(:physician)
        login_as(@patient)
        page.set_rack_session(:user_id => @physician.id)
        visit user_path(id: @physician.id)
        click_on 'Edit Your Profile'
        fill_in 'Name', with: 'Dave'
        fill_in 'Email', with: 'dsmith@gmail.com'
        fill_in 'Password', with: 'HotSummer'
        fill_in 'Npi', with: '1234567891'
        fill_in 'Specialty', with: 'Family Medicine'
        click_on 'Update User'
        expect(page).to have_content('dsmith@gmail.com')
    end

    scenario 'only update edited data' do
        @physician = create(:physician)
        login_as(@patient)
        page.set_rack_session(:user_id => @physician.id)
        visit user_path(id: @physician.id)
        click_on 'Edit Your Profile'
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'dsmith@gmail.com'
        fill_in 'Password', with: 'HotSummer'
        fill_in 'Npi', with: '1234567891'
        fill_in 'Specialty', with: 'Family Medicine'
        click_on 'Update User' #need to add restriction to prevent null data 
        expect(page).to have_content("Name can't be blank, Name is too short (minimum is 2 characters)")
    end
end