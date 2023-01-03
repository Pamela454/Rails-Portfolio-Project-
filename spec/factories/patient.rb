FactoryBot.define do
    factory :patient do
      name { Faker::Internet.name }
      email { Faker::Internet.email }
      password { Faker::Internet.password }
    end
  end