# frozen_string_literal: true

module Mercadona
  module Discount
    class Quantity < Mercadona::Discount::Base
      def call
        return amount_without_discount unless discount_case?

        amount_without_discount - (discount * order_item_quantity)
      end

      private

      def discount
        @discount ||= (discount_rule.discount * 100).to_i
      end
    end
  end
end
