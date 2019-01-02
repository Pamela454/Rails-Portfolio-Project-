class Category < ApplicationRecord
  has_many :message_categories
  has_many :messages, through: :message_categories
end
