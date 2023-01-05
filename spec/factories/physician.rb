FactoryBot.define do
    factory :physician do
      name { Faker::Internet.name }
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      npi { Faker::Number.number(10) }
      specialty { Faker::Lorem.word }
    end
  end
