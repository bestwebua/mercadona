# frozen_string_literal: true

RSpec.describe Mercadona::DiscountResolver do
  describe '.call' do
    subject(:discount_resolver) { described_class.call(42) }

    it { is_expected.to be_nil }
  end
end
