require 'rails_helper'

RSpec.describe 'Logout a patient user', type: :feature do
    #create patient
    #go to patient show page
    #expect page to have user email
    #click logout
    #expect to return to login page

    scenario 'success' do
        @patient = create(:patient, email: 'cat@gmail.com')
        login_as(@patient)
        page.set_rack_session(:user_id => @patient.id)
        visit user_path(id: @patient.id)
        expect(page).to have_content("Email: cat@gmail.com")
        click_on ('Log Out')
        expect(page).to have_content("Successfully logged out")
        #expect(session[:user_id]).to equal('nil')
    end
end