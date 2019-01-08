class Response < ApplicationRecord
  belongs_to :physician, foreign_key: :physician_id
  belongs_to :message

end
