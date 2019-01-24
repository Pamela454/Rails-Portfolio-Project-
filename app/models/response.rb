class Response < ApplicationRecord
  belongs_to :physician, foreign_key: :physician_id
  belongs_to :message
  validates :response, presence: true
  accepts_nested_attributes_for :physician
  #scope :all_message_ids -> Response.pluck(:message_id)

  def physician_attributes=(hash)
    hash.each do |i, att|
      if att.present?
        user = User.find_or_create_by(:username => att)
        self.physician = physician
      end
    end
  end
end
