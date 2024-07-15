# frozen_string_literal: true

module Mercadona
  ALLOWED_COMPARISON_OPERATORS = %w[== < > >= <=].freeze

  require_relative '../mercadona/version'
  require_relative '../mercadona/error/argument'
  require_relative '../mercadona/error/runtime'
  require_relative '../mercadona/entity/base'
  require_relative '../mercadona/entity/discount_rule'
  require_relative '../mercadona/entity/order_item'
  require_relative '../mercadona/amount_formatter'
  require_relative '../mercadona/discount/base'
  require_relative '../mercadona/discount/bogo'
  require_relative '../mercadona/discount/quantity'
  require_relative '../mercadona/checkout'
end
