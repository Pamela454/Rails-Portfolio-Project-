require 'rails_helper'

RSpec.describe 'Edit a Response', type: :feature do
  scenario 'valid inputs' do
    #login as physician user
    #click on "edit response" link for a particular question
    #enter response field
    #click submit link
    #check user show page for response data

    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    @response = create(:response, message_id: 1, physician_id: 1)
    login_as(@physician)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:physician_id => @physician.id)
    visit user_path(id: @physician.id)
    click_on 'Edit Response'
    fill_in 'response[response]', with: 'Looks like a large rash'
    click_on 'Update Response'
    expect(page).to have_content('Response successfully edited')
  end

  scenario 'invalid inputs' do
    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    @response = create(:response, message_id: 1, physician_id: 1)
    login_as(@physician)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:physician_id => @physician.id)
    visit user_path(id: @physician.id)
    click_on 'Edit Response'
    fill_in 'response[response]', with: ''
    click_on 'Update Response'
    expect(page).to have_content("Response can't be blank")
  end

  scenario 'edit response as patient' do
    physician = create(:physician)
    patient = create(:patient, id: 2)
    messages = create_list(:message, 11, patient_id: 2)
    response = create(:response, message_id: 1, physician_id: 1)
    login_as(patient)
    page.set_rack_session(:user_id => patient.id)
    page.set_rack_session(:physician_id => patient.id)
    visit user_path(id: patient.id)
    expect(page).to have_no_content("Edit Response")
  end
end