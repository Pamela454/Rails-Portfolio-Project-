class Patient < User
  has_secure_password
  belongs_to :user
  has_many :physicians, :through => :messages
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true

#validations specific to this model
end
