class Message < ApplicationRecord
  belongs_to :physician
  belongs_to :patiient

end
