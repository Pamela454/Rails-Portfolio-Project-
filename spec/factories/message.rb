FactoryBot.define do
    factory :message do
      title { Faker::Lorem.word }
      question { Faker::Lorem.word }
    end
end
