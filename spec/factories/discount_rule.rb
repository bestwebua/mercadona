# frozen_string_literal: true

FactoryBot.define do
  factory :discount_rule, class: 'Mercadona::Entity::DiscountRule' do
    type { nil }
    condition { discount_rule_condition }
    quantity { random_integer }
    discount { discount_rule_reduction }

    trait :bogo_discount do
      condition { '>=' }
      quantity { 2 }
      discount { nil }
    end

    trait :quantity_discount do
      condition { '>=' }
      quantity { 3 }
      discount { 0.5 }
    end

    trait :bulk_discount do
      condition { '>=' }
      quantity { 3 }
      discount { 1/3r }
    end
  end
end
