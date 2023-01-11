require 'rails_helper'

RSpec.describe Message, type: :model do
    context 'numeric message is saved as a string' do
      it 'does not create a new message' do
        @message = Message.new(title: 1234, question: 1234567)
        @message.save
        expect(@message.question.class).to eq(String)
        expect(@message.title.class).to eq(String)
      end
    end
  end
  