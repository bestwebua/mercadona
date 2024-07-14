# frozen_string_literal: true

module Mercadona
  module AmountFormatter
    def self.call(currency, amount)
      ::Kernel.format("#{currency}%.2f", amount)
    end
  end
end
