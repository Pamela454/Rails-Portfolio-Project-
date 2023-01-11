require 'rails_helper'

RSpec.describe Response, type: :model do
    context 'numeric response is saved as a string' do
      it 'creates a new response that is a string' do
        @response = Response.new(response: 1234567)
        @response.save
        expect(@response.response.class).to eq(String)
      end
    end
  end