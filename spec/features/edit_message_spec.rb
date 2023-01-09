require 'rails_helper'

RSpec.describe 'Edit a Message', type: :feature do
  scenario 'valid inputs' do
    #create a patient
    #visit patient show page
    #click on edit question
    #fill in message data
    #click update message
    #visit patient show page
    #expect page to have Message successfully edited 

    @patient = create(:patient, id: 2)
    @categories = create_list(:category, 11)
    @message = create(:message, patient_id: 2)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Edit Question'
    visit edit_user_message_path(:user_id => @patient.id, :id => @message.id)
    fill_in 'message_title', with: 'Sore Throat'
    fill_in 'message_question', with: 'I have a sore throat with white patches.'
    click_on 'Update Message'
    expect(page).to have_content("Message successfully updated")
  end
end