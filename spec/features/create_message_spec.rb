require 'rails_helper'

RSpec.describe 'Creating a Message', type: :feature do
  scenario 'valid inputs' do
    #create a patient
    #visit patient show page
    #click on ask a question
    #fill in message data
    #click create message
    #visit patient show page
    #expect page to have Message successfully created

    @patient = create(:patient)
    @categories = create_list(:category, 11)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Ask A Question'
    visit new_user_message_path(:user_id => @patient.id)
    fill_in 'message_title', with: 'Sore Throat'
    fill_in 'message_question', with: 'I have a sore throat with white patches.'
    click_on 'Create Message'
    expect(page).to have_content("Sore Throat")
  end

  scenario 'invalid inputs' do
    @patient = create(:patient)
    @categories = create_list(:category, 11)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Ask A Question'
    visit new_user_message_path(:user_id => @patient.id)
    fill_in 'message_title', with: ''
    fill_in 'message_question', with: 'I have a sore throat with white patches.'
    click_on 'Create Message'
    expect(page).to have_content("Title can't be blank")
  end
end