class Category < ApplicationRecord
  has_many :message_categories
  has_many :messages, through: :message_categories
  scope :new_condition, -> { where("category_id = 1") }
  scope :existing_condition, -> { where("category_id = 2") }

end
