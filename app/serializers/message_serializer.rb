class MessageSerializer < ActiveModel::Serializer
	attributes :title, :question 
	has_many :responses
	has_many :message_categories 
end