# frozen_string_literal: true

FactoryBot.define do
  factory :order_item, class: 'Mercadona::OrderItem' do
    product_code { random_product_code }
    name { product_codes[product_code] }
    price { random_product_price }

    trait :green_tea do
      product_code { 'GR1' }
      price { 3.11 }
    end

    trait :strawberry do
      product_code { 'SR1' }
      price { 5.0 }
    end

    trait :coffee do
      product_code { 'CF1' }
      price { 11.23 }
    end
  end
end
