require 'rails_helper'

RSpec.describe 'Creating a Message', type: :feature do
  scenario 'valid inputs' do
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

  scenario 'invalid inputs' do
    @patient = create(:patient)
    @categories = create_list(:category, 11)
    login_as(@patient)
    page.set_rack_session(:user_id => @patient.id)
    page.set_rack_session(:patient_id => @patient.id)
    visit user_path(id: @patient.id)
    click_on 'Ask A Question'
    visit new_user_message_path(:user_id => @patient.id)
    fill_in 'message_title', with: 'Sore Throat'
    fill_in 'message_question', with: ''
    click_on 'Create Message'
    expect(page).to have_content("Question can't be blank")
  end

  scenario 'create message as a physician' do
    physician = create(:physician)
    categories = create_list(:category, 11)
    login_as(physician)
    page.set_rack_session(:user_id => physician.id)
    page.set_rack_session(:patient_id => physician.id)
    visit user_path(id: physician.id)
    expect(page).to have_no_content("Ask A Question")
  end
end