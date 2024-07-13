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
    end
  end
end
