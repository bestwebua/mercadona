# frozen_string_literal: true

module Mercadona
  module Entity
    OrderItem = Mercadona::Entity::Base.new(:product_code, :name, :price, keyword_init: true) do
      # Understanding Ruby's floating-point precision issues for money calculations,
      # let's use whole numbers instead of floats.
      def price_in_fractional_currency
        (price.to_f * 100).to_i
      end
    end
  end
end
