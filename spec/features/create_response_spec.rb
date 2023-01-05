require 'rails_helper'

RSpec.describe 'Creating a Response', type: :feature do
  scenario 'valid inputs' do
    #login as physician user
    #click on response link for a particular question
    #enter response field
    #click submit link
    #check user show page for response data

    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    login_as(@patient)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:patient_id => @physician.id)
    visit user_path(id: @physician.id)
    first(:link, 'Respond to Question').click
    fill_in 'Response', with: 'Looks like a rash'
    click_on 'Create Response'
    expect(page).to have_content('Looks like a rash')
  end

  scenario 'invalid inputs' do
    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    login_as(@patient)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:patient_id => @physician.id)
    visit user_path(id: @physician.id)
    first(:link, 'Respond to Question').click
    fill_in 'Response', with: ''
    click_on 'Create Response'
    expect(page).to have_content("Response can't be blank")
  end
end