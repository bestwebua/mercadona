# frozen_string_literal: true

module Mercadona
  OrderItem = ::Struct.new(:product_code, :name, :price, keyword_init: true)
end
