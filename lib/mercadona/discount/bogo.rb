# frozen_string_literal: true

module Mercadona
  module Discount
    class Bogo < Mercadona::Discount::Base
      def call
        return amount_without_discount unless discount_case?

        amount_without_discount - order_item_price
      end
    end
  end
end
