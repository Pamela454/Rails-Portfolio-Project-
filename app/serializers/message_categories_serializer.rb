class MessageCategory < ActiveModel::Serializer
  attributes :category_id, :message_id
  belongs_to :message
  belongs_to :category
end