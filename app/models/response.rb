class Response < ApplicationRecord
  belongs_to :physician, foreign_key: :physician_id
  belongs_to :message
  accepts_nested_attributes_for :physician

  def physician_attributes=(hash)
    hash.each do |i, att|
      if att.present?
        user = User.find_or_create_by(:username => att)
        self.physician = physician
      end
    end
  end
end
