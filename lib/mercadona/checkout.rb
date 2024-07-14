# frozen_string_literal: true

module Mercadona
  class Checkout
    DEFAULT_CURRENCY = '£'
    INITIAL_AMOUNT = 0.0

    def initialize(discount_rules, currency = Mercadona::Checkout::DEFAULT_CURRENCY)
      @discount_rules = discount_rules
      @currency = currency
      @basket = []
    end

    def scan(order_item)
      basket << order_item
    end

    def total
      Mercadona::AmountFormatter.call(currency, calculate_amount)
    end

    private

    attr_reader :discount_rules, :currency, :basket

    def discount_order_item?(order_item)
      discount_rules.key?(order_item.product_code)
    end

    def calculate_amount
      basket.tally.inject(Mercadona::Checkout::INITIAL_AMOUNT) do |amount, (order_item, quantity)|
        next amount + Mercadona::DiscountResolver.call(discount_rules, order_item, quantity) if discount_order_item?(order_item)

        amount + (order_item.price * quantity)
      end
    end
  end
end