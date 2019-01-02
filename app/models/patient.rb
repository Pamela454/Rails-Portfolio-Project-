class Patient < User
  has_secure_password
  belongs_to :user
  has_many :messages
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }

#validations specific to this model
end
