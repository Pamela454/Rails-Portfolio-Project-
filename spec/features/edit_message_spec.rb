require 'rails_helper'

RSpec.describe 'Edit a Message', type: :feature do
  scenario 'valid inputs' do
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

  scenario 'invalid title input' do
    @patient = create(:patient, id: 2)
    @categories = create_list(:category, 11)
    @message = create(:message, patient_id: 2)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Edit Question'
    visit edit_user_message_path(:user_id => @patient.id, :id => @message.id)
    fill_in 'message_title', with: ''
    fill_in 'message_question', with: 'I have a sore throat with white patches.'
    click_on 'Update Message'
    expect(page).to have_content("Title can't be blank")
    click_on 'Go Back to User Show Page'
    expect(page).to have_content("Title: #{@message.title}")
    expect(page).to have_content("Body: #{@message.question}")
  end

  scenario 'invalid body input' do
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
    fill_in 'message_question', with: ''
    click_on 'Update Message'
    expect(page).to have_content("Question can't be blank")
    click_on 'Go Back to User Show Page'
    expect(page).to have_content("Title: #{@message.title}")
    expect(page).to have_content("Body: #{@message.question}")
  end

  scenario 'edit message as a physician' do
    patient = create(:patient, id: 2)
    physician = create(:physician)
    categories = create_list(:category, 11)
    message = create(:message, patient_id: 2)
    login_as(physician)
    page.set_rack_session(:user_id => physician.id)
    page.set_rack_session(:patient_id => physician.id)
    visit user_path(id: physician.id)
    expect(page).to have_no_content("Edit Question")
  end
end