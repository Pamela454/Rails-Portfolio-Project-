require 'rails_helper'

RSpec.describe Physician, type: :model do

    context 'incorrect email address' do
        #let!(:physician1) { create(:physician)}

     it 'throws error due to incorrect format' do
        physician1 = build(:physician, email: "dan")
        physician1.valid?
        expect(physician1.errors[:email]).to include('is invalid')
     end

   end 

end