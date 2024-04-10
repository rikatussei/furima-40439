FactoryBot.define do
  factory :order_delivery_address do
    postal_code      { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京都' }
    street_address   { '1-1' }
    building_name    { '東京ハイツ' }
    phone_number     { "012-345-6789" }
  end
end
