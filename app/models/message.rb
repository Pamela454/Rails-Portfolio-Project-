class Message < ApplicationRecord
  belongs_to :patient, foreign_key: :patient_id
  has_many :message_categories
  has_many :categories, through: :message_categories
  has_many :responses
  has_many :physicians, through: :responses
  validates :title, presence: true
  validates :question, presence: true
  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :message_categories
  scope :new_condition, -> {joins(:categories).merge(Category.new_condition)}
  scope :existing_condition, -> {joins(:categories).merge(Category.existing_condition)}
  scope :unanswered_questions, -> {left_outer_joins(:responses).where(responses: {message_id: nil})}

  def responses_attributes=(responses_attributes)
    responses_attributes.values.each do |response_attribute|
      response = Response.find_or_create_by(response_attribute)
      self.response_attributes.build(response: response)
    end
  end
end
