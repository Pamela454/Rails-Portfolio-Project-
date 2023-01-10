require 'rails_helper'

RSpec.describe 'Deleting a Message', type: :feature do
  scenario 'valid inputs' do

    @patient = create(:patient)
    @categories = create_list(:category, 11)
    @message = create(:message, patient_id: 1)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Delete Question'
    expect(page).to have_content('Message successfully deleted')
    expect(page).to have_no_content("Title: #{@message.title}")
    expect(page).to have_no_content("Question: #{@message.question}")
   end
  end