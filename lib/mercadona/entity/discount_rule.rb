# frozen_string_literal: true

module Mercadona
  module Entity
    DiscountRule = Mercadona::Entity::Base.new(:type, :condition, :quantity, :discount, keyword_init: true) do
      def amount_with_discount(order_item, order_item_quantity)
        type.call(self, order_item, order_item_quantity)
      end
    end
  end
end
