class Message < ApplicationRecord
  belongs_to :physician, optional: true
  belongs_to :patient, optional: true 

end
