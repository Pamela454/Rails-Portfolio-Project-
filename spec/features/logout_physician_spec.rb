require 'rails_helper'

RSpec.describe 'Logout a physician user', type: :feature do
    #create physician
    #go to physician show page
    #expect page to have user email
    #click logout
    #expect to return to login page

    scenario 'success' do
        @physician = create(:physician, email: 'cat@gmail.com')
        login_as(@patient)
        page.set_rack_session(:user_id => @physician.id)
        visit user_path(id: @physician.id)
        expect(page).to have_content('cat@gmail.com')
        click_on ('Log Out')
        expect(page).to have_content("Successfully logged out")
    end
end