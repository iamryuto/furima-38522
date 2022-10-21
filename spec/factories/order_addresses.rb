FactoryBot.define do
  factory :order_address do
    token {Faker::Internet.password(min_length: 20, max_length: 30)}
    zip { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to:48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    phone_number { Faker::Number.leading_zero_number(digits: 11) }
  end
end
