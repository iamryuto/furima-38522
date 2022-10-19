FactoryBot.define do
  factory :item do
    item_name {'商品名'}
    explanation {'これは説明文です。'}
    price {7000}
    prefecture_id {2}
    category_id {2}
    state_id {2}
    fee_id {2}
    day_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
