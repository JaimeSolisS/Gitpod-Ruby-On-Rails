FactoryBot.define do
  factory :tweet do
    text { Faker::Lorem.word  }
    user_id nil
  end
end