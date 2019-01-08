class User < ApplicationRecord
  has_secure_password
  scope :patients, -> { where(type: 'Patient') }  #scope method, same as defining a class method
  scope :physicians, -> { where(type: 'Physician') }
  scope :patients_question, -> { patients.where("message > 0")} #returns a list of objects
  scope :physicians_response, -> { physicians.where("response > 0")}  #returns a list of objects
  has_many :physicians
  has_many :patients
end

  #written as a class method
  #self.patients
    #where(user_type: "Patient")  -would have to handle the case where there are no patients
  #end
