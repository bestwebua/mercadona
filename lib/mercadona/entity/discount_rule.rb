# frozen_string_literal: true

module Mercadona
  module Entity
    DiscountRule = Mercadona::Entity::Base.new(:type, :condition, :quantity, :discount, keyword_init: true) do
      def initialize(type:, condition:, **args)
        validate_sensitive_args(type, condition)
        super
      end

      def amount_with_discount(order_item, order_item_quantity)
        type.call(self, order_item, order_item_quantity)
      end

      private

      def discount_class_valid?(discount_class)
        discount_class.respond_to?(:call)
      end

      def comparison_operator_valid?(comparison_operator)
        Mercadona::ALLOWED_COMPARISON_OPERATORS.include?(comparison_operator)
      end

      def validate_sensitive_args(discount_class, comparison_operator)
        raise Mercadona::Error::Argument, Mercadona::Error::Argument::DISCOUNT_CLASS unless discount_class_valid?(discount_class)
        raise Mercadona::Error::Argument, Mercadona::Error::Argument::COMPARISON_OPERATOR unless comparison_operator_valid?(comparison_operator)
      end
    end
  end
end
