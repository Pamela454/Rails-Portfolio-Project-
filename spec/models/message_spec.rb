require 'rails_helper'

RSpec.describe Message, type: :model do
    context 'numeric message is saved as a string' do
      it 'creates a new message that is a string' do
        @message = Message.new(title: 1234, question: 1234567, patient_id: 1)
        @message.save
        expect(@message.question.class).to eq(String)
        expect(@message.title.class).to eq(String)
      end

        let!(:patient1) { create(:patient)}
        let!(:category1) { create(:category, id: 1, category: 'New Condition') }
        let!(:category2) { create(:category, id: 2, category: 'Existing Condition') } 
        let!(:message1) { create(:message, patient_id: patient1.id, title: "sore throat", question: "I have a new sore throat", category_ids: category1.id)}
        let!(:message2) { create(:message, patient_id: patient1.id, title: "red rash", question: "I still have a rash on my arm.", category_ids: category2.id)}
        let!(:message3) { create(:message, patient_id: patient1.id, title: "cough", question: "I have a new cough.", category_ids: category1.id)}

        it 'new_condition scope returns messages with new_condition category' do
            expect(Message.new_condition).to include(message1, message3)
        end

        it 'new_condition scope returns messages without existing_condition category' do
            expect(Message.new_condition).to_not include(message2)
        end

        it 'existing_condition returns messages without new_condition category' do
            expect(Message.existing_condition).to_not include(message1, message3)
        end

        it 'existing_condition returns messages with an existing_condition category' do
           expect(Message.existing_condition).to include(message2)
        end

        it 'allows patient to send multiple messages' do
          expect(Message.where(patient_id: patient1.id).count()).to be == 3
        end
    end

  end
  