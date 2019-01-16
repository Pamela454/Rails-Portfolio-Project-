class Message < ApplicationRecord
  belongs_to :patient, foreign_key: :patient_id
  has_many :message_categories
  has_many :categories, through: :message_categories
  has_many :responses
  has_many :physicians, through: :responses
  accepts_nested_attributes_for :categories
  validates :category_id, presence: true

  #need scope method to allow search for specialty or answered questions

  def responses_attributes=(responses_attributes)
    responses_attributes.values.each do |response_attribute|
      response = Response.find_or_create_by(response_attribute)
      self.response_attributes.build(response: response)
    end
  end
end
