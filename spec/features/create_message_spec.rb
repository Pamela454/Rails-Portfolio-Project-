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
    login_as(FactoryBot.create(:patient))
    page.set_rack_session(:user_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Ask A Question'
    visit new_user_message_path(user_id: @patient.id)
    #need category data
    fill_in 'title', with: 'Sore Throat'
    fill_in 'question', with: 'I have a sore throat with white patches.'
    click_on 'Create Message'
    #visit user_path(user_id: @patient.id) 
    #expect(page).to have_content('Name')
  end
end