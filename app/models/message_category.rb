class MessageCategory < ApplicationRecord
  belongs_to :message
  belongs_to :category
end
