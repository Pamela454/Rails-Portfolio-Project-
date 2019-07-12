class MessageSerializer < ActiveModel::Serializer
	attributes :title, :question, :created_at
	has_many :message_categories
    has_many :categories, through: :message_categories
    has_many :responses
    has_many :physicians, through: :responses
end