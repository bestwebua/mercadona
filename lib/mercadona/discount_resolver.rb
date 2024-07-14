# frozen_string_literal: true

module Mercadona
  module DiscountResolver
    def self.call(discount_rules, order_item, quantity)
      target_discount, *discount_rule = discount_rules[order_item.product_code]
      Mercadona::DiscountType
        .const_get(target_discount.to_s.capitalize)
        .call(discount_rule, order_item, quantity)
    end
  end
end
