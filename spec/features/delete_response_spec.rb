require 'rails_helper'

RSpec.describe 'Deleting a Response', type: :feature do
  scenario 'valid click' do
    @physician = create(:physician)
    @patient = create(:patient, id: 2)
    @messages = create_list(:message, 11, patient_id: 2)
    @response = create(:response, physician_id: @physician.id, message_id: @messages[0].id)
    login_as(@physician)
    page.set_rack_session(:user_id => @physician.id)
    page.set_rack_session(:patient_id => @physician.id)
    visit user_path(id: @physician.id)
    click_on 'Delete Response'
    expect(page).to have_content('Response successfully deleted')
    expect(page).to have_no_content("Response: #{@response.response}")
   end
  end