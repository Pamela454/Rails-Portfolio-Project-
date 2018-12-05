class Physician < User
  has_many :patients, :through => :messages
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :npi, presence: true
  validates :specialty, presence: true

#validations specific to this model
end
