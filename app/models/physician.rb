class Physician < User
  include ActiveModel::Validations
  has_secure_password
  belongs_to :user, optional: true   #association macro
  has_many :responses, dependent: :destroy
  has_many :messages, through: :responses
  validates :email, format: {with: /@/}  
  validates :name, :email, :npi, :specialty, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates_length_of :npi, is: 10, uniqueness: true
  validates :npi, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

#validations specific to this model

  def self.model_name
    User.model_name
  end
end
