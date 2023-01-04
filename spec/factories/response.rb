FactoryBot.define do
    factory :response do
      response { Faker::Lorem.word }
    end
end