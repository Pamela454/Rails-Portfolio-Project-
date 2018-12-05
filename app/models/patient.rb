class Patient < User
  belongs_to :user
  has_many :physicians, :through => :messages
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

#validations specific to this model
end
