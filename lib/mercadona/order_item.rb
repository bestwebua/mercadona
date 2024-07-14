# frozen_string_literal: true

module Mercadona
  OrderItem = ::Struct.new(:product_code, :name, :price, keyword_init: true) do
    # Know about Ruby Float (im)precision let's use
    # whole numbers instead of float for calculations
    def price_in_fractional_currency
      (price.to_f * 100).to_i
    end
  end
end
