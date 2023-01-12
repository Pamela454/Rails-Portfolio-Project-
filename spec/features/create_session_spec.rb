require 'rails_helper'

RSpec.describe 'Creating a session', type: :feature do
    scenario 'using facebook logon' do
        visit root_path
        find_button("Login With Facebook").click
        expect(page).to have_content("Login")
    end
end