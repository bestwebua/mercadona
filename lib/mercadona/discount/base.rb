# frozen_string_literal: true

module Mercadona
  module Discount
    class Base
      DISCOUNT_RULES_ATTRS = %i[condition quantity].freeze

      def self.call(discount_rule, order_item, order_item_quantity)
        new(discount_rule, order_item, order_item_quantity).call
      end

      def initialize(discount_rule, order_item, order_item_quantity)
        @discount_rule = discount_rule
        @order_item_price = order_item.price_in_fractional_currency
        @order_item_quantity = order_item_quantity
      end

      def call
        raise Mercadona::Error::Runtime, Mercadona::Error::Runtime::NOT_IMPLEMENTED
      end

      private

      attr_reader :discount_rule, :order_item_price, :order_item_quantity

      Mercadona::Discount::Base::DISCOUNT_RULES_ATTRS.each do |method_name|
        define_method(method_name) { discount_rule.public_send(method_name) }
      end

      def discount_case?
        order_item_quantity.public_send(condition, quantity)
      end

      def amount_without_discount
        @amount_without_discount ||= order_item_price * order_item_quantity
      end
    end
  end
end
