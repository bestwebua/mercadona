# frozen_string_literal: true

module Mercadona
  module Error
    class Argument < ::ArgumentError
      DISCOUNT_CLASS = 'type: must have a :call method'
      COMPARISON_OPERATOR = "condition: must be one of #{Mercadona::ALLOWED_COMPARISON_OPERATORS.join(', ')}"
    end
  end
end
