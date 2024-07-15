# frozen_string_literal: true

module Mercadona
  class Checkout
    DEFAULT_CURRENCY = '£'
    INITIAL_AMOUNT = 0

    def initialize(discount_rules, currency = Mercadona::Checkout::DEFAULT_CURRENCY)
      @discount_rules = discount_rules
      @currency = currency
      @basket = []
    end

    def scan(order_item)
      basket << order_item
    end

    def total
      Mercadona::AmountFormatter.call(currency, calculate_amount / 100.0)
    end

    private

    attr_reader :discount_rules, :currency, :basket

    def discount_order_item?(order_item)
      discount_rules.key?(order_item.product_code)
    end

    def amount_with_discount(order_item, quantity)
      discount_rules[order_item.product_code].amount_with_discount(order_item, quantity)
    end

    def calculate_amount
      # Because the technical brief does not specify the pricing method (whether per item or per specific weight),
      # we will simplify our calculations by using the price per item as the reference point.
      basket.tally.inject(Mercadona::Checkout::INITIAL_AMOUNT) do |amount, (order_item, quantity)|
        next amount + amount_with_discount(order_item, quantity) if discount_order_item?(order_item)

        amount + (order_item.price_in_fractional_currency * quantity)
      end
    end
  end
end
