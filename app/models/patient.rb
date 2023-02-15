class Patient < User
  has_secure_password
  belongs_to :user, optional: true
  has_many :messages, dependent: :destroy
  validates :email, format: {with: /@/}  
  validates :name, :email, :password_digest, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create 
  validates :name, length: { minimum: 2 }

#validations specific to this model

  def self.model_name 
    User.model_name
  end
end
