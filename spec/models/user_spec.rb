require 'rails_helper'

RSpec.describe User, type: :model do
    let!(:patient1) { create(:patient)}
    let!(:physician1) { create(:physician)}

    it 'patients scope returns users with user type of patient' do
        expect(User.patients).to include(patient1)
    end

    it 'patients scope does not return users with user type of physician' do
        expect(User.patients).to_not include(physician1)
    end

    it 'physicians scope returns users with user type of physician' do
        expect(User.physicians).to include(physician1)
    end

    it 'physicians scope does not return users with user type of patient' do
        expect(User.physicians).to_not include(patient1)
    end

end