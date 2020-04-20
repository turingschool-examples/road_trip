FactoryBot.define do
  factory :traveler do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 1, to: 80) }
  end
end
