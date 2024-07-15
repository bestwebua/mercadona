# frozen_string_literal: true

module Mercadona
  module Discount
    class Bulk < Mercadona::Discount::Base
      def call
        return amount_without_discount unless discount_case?

        amount_without_discount - (amount_without_discount * discount).round
      end

      private

      def discount
        @discount ||= discount_rule.discount.to_f
      end
    end
  end
end
