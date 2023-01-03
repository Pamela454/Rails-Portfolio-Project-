FactoryBot.define do
    factory :physician do
      name { Faker::Internet.name }
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      npi { Faker::Internet.npi }
      specialty { Faker::Internet.specialty }
    end
  end
