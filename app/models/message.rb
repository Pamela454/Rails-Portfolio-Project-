class Message < ApplicationRecord
  belongs_to :user
  has_many :message_categories
  has_many :categories, through: :message_categories
  has_many :responses
  has_many :physicians, through: :responses

  #need scope method to allow search for specialty or answered questions
end
