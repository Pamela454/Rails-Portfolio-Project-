class User < ApplicationRecord
  has_secure_password
  scope :patients, -> { where(type: 'Patient') }  #scope method, same as defining a class method
  scope :physicians, -> { where(type: 'Physician') }
  has_many :physicians
  has_many :patients


end

  #written as a class method
  #self.patients
    #where(user_type: "Patient")  -would have to handle the case where there are no patients
  #end
