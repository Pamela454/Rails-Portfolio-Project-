class PhysicianSerializer < ActiveModel::Serializer  
  attributes :id, :email, :password_digest, :type, :name, :npi, :specialty, :uid  
  has_many :responses
  has_many :messages, through: :responses

end