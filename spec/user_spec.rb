require_relative "./rails_helper.rb"

RSpec.describe User, type: :model do
    it "requires a secure password" do 
        expect(User.new).not_to be_valid
    end
end