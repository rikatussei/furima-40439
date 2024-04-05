FactoryBot.define do
  factory :item do
    product_name               {"商品名"}
    product_description        {"商品の説明"}
    category_id                {2}
    item_condition_id          {2}
    shipping_cost_id           {2}
    prefecture_id              {2}
    delivery_time_id           {2}
    price                      { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/files/sample_image.jpg')),
        filename: 'sample_image.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
