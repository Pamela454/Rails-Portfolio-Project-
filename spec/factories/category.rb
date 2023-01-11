FactoryBot.define do
    factory :category do
      id { Faker::Number.between(1,10)}
      category { Faker::Lorem.word }
    end
  end
