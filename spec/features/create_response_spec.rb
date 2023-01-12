require 'rails_helper'

RSpec.describe 'Creating a Response', type: :feature do
  scenario 'valid inputs' do
    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    login_as(@physician)
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
    login_as(@physician)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:patient_id => @physician.id)
    visit user_path(id: @physician.id)
    first(:link, 'Respond to Question').click
    fill_in 'Response', with: ''
    click_on 'Create Response'
    expect(page).to have_content("Response can't be blank")
  end

  scenario 'create response as a patient' do
    patient = create(:patient)
    physician = create(:physician, id: 2)
    messages = create_list(:message, 11, patient_id: 1)
    login_as(patient)
    page.set_rack_session(:user_id => patient.id)
    page.set_rack_session(:patient_id => patient.id)
    visit user_path(id: patient.id)
    expect(page).to have_no_content("Respond to Question")
  end
end