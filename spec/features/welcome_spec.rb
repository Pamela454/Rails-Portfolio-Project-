require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  describe 'welcome page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Welcome to Ask A Health Question')
    end
  end
end