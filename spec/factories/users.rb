FactoryBot.define do
  factory :user do
    nickname              { '山田太郎' }
    email                 { Faker::Internet.email }
    password              { '1234test' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
