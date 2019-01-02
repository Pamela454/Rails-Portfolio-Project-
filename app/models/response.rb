class Response < ApplicationRecord
  belongs_to :physician
  belongs_to :message

end
