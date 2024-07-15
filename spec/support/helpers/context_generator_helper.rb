# frozen_string_literal: true

module Mercadona
  module RspecHelper
    module ContextGenerator
      module_function

      def product_codes
        {
          'GR1' => 'Green tea',
          'SR1' => 'Strawberries',
          'CF1' => 'Coffee'
        }.freeze
      end

      def random_product_code
        product_codes.keys.sample
      end

      def random_product_price
        ::Kernel.rand(1.0..12).round(2)
      end

      def random_integer(end_range = 42)
        ::Kernel.rand(1..end_range)
      end

      def discount_rule_condition
        %w[> >=].sample
      end

      def random_fraction
        Rational(1, Rational(random_integer(10)))
      end

      def discount_rule_reduction
        [nil, random_product_price, random_fraction].sample
      end

      def create_dummy_discount_type(result = random_integer)
        proc { result }
      end

      def create_checkout(discount_rules)
        Mercadona::Checkout.new(discount_rules)
      end
    end
  end
end
