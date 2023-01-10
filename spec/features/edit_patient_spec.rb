require 'rails_helper'

RSpec.describe 'Edit patient user', type: :feature do
    #create patient user
    #visit user path
    #click on edit profile
    #fill out form
    #click submit
    #check for changes on user page

    scenario 'valid inputs' do
        @patient = create(:patient)
        login_as(@patient)
        page.set_rack_session(:user_id => @patient.id) 
        visit user_path(id: @patient.id)
        click_on 'Edit Your Profile'
        fill_in 'Name', with: 'Dave'
        fill_in 'Email', with: 'dsmith@gmail.com'
        fill_in 'Password', with: 'HotSummer'
        click_on 'Update User'
        expect(page).to have_content('dsmith@gmail.com')
    end

    scenario 'only update edited data' do
        @patient = create(:patient)
        login_as(@patient)
        page.set_rack_session(:user_id => @patient.id)
        visit user_path(id: @patient.id)
        click_on 'Edit Your Profile'
        fill_in 'Name', with: ''
        fill_in 'Email', with: 'dsmith@gmail.com'
        fill_in 'Password', with: 'HotSummer'
        click_on 'Update User' 
        binding.pry
        expect(page).to have_content("Name can't be blank")
    end
end