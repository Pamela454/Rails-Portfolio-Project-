require 'rails_helper'

RSpec.describe Response, type: :model do
    context 'numeric response is saved as a string' do
      it 'creates a new response that is a string' do
        @response = Response.new(response: 1234567)
        @response.save
        expect(@response.response.class).to eq(String)
      end
    end

    let!(:patient1) { create(:patient)}
    let!(:physician1) { create(:physician)}
    let!(:message1) { create(:message, patient_id: patient1.id, title: "sore throat", question: "I have a new sore throat")}
    let!(:response1) {create(:response, message_id: message1.id, physician_id: physician1.id )}
    let!(:response2) {create(:response, message_id: message1.id, physician_id: physician1.id )}

    it 'allows for multiple responses' do
      expect(Message.first.responses).to include(response1, response2)
    end

  end