class ResponseSerializer < ActiveModel::Serializer
	attributes :response, :physician_id, :message_id, :id
	belongs_to :physician, foreign_key: :physician_id
    belongs_to :message
end