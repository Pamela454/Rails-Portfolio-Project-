class User < ApplicationRecord
  has_secure_password
  scope :patients, -> { where(user_type: 'Patient') }
  scope :physicians, -> { where(user_type: 'Physician') }
  has_many :physicians
  has_many :patients
end
