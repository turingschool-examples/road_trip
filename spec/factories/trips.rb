FactoryBot.define do
  factory :trip do
    title { Faker::Name.name }
    destination_city { Faker::Address.city }
    mileage {Faker::Number.between(from: 1, to: 50) }
  end
end
