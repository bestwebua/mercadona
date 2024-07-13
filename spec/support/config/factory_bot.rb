# frozen_string_literal: true

require 'factory_bot'

module FactoryBot
  class SyntaxRunner
    require_relative '../helpers/context_generator_helper'
    include Mercadona::RspecHelper::ContextGenerator
  end
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

FactoryBot.define do
  initialize_with { new(attributes) }
  to_create { |_| } # rubocop:disable Lint/EmptyBlock
end
