# frozen_string_literal: true

module Mercadona
  module Error
    class Runtime < ::RuntimeError
      NOT_IMPLEMENTED = 'call method must be implemented'
    end
  end
end
