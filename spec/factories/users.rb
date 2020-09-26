FactoryBot.define do
  factory :user do
    username { Faker::Lorem.word }
    name { Faker::Lorem.word }
    avatar { Faker::Lorem.word }
   
  end
end