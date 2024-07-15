# frozen_string_literal: true

module Mercadona
  module Entity
    class Base < ::Struct; alias attributes members; end
  end
end
