require 'rails_helper'

RSpec.describe Patient, type: :model do

    context 'incorrect email address' do

     it 'throws error due to incorrect format' do
        patient = build(:patient, email: "dan")
        patient.valid?
        expect(patient.errors[:email]).to include('is invalid')
     end
   end 

end