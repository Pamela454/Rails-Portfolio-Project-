class Physician < User
  has_secure_password
  belongs_to :user
  has_many :responses
  has_many :messages, through: :responses
  validates :name, :email, :npi, :specialty, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :npi, length: { minimum: 10 }

#validations specific to this model
end
