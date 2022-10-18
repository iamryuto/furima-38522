FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { '12345a' }
    password_confirmation { password }
    birthday { Faker::Date.birthday(min_age: 10, max_age: 90) }
    last_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
  end
end
