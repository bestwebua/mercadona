# frozen_string_literal: true

FactoryBot.define do
  factory :discount_rule, class: 'Mercadona::Entity::DiscountRule' do
    type { create_dummy_discount_type }
    condition { discount_rule_condition }
    quantity { random_integer }
    discount { discount_rule_reduction }

    trait :bogo_discount do
      type { Mercadona::Discount::Bogo }
      condition { '>=' }
      quantity { 2 }
      discount { nil }
    end

    trait :quantity_discount do
      type { Mercadona::Discount::Quantity }
      condition { '>=' }
      quantity { 3 }
      discount { 0.5 }
    end

    trait :bulk_discount do
      type { Mercadona::Discount::Bulk }
      condition { '>=' }
      quantity { 3 }
      discount { 1/3r }
    end
  end
end
