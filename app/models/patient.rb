class Patient < User
  has_secure_password
  belongs_to :user, optional: true
  has_many :messages, dependent: :destroy
  validates :name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :name, length: { minimum: 2 }

#validations specific to this model

  def self.model_name 
    User.model_name
  end
end
