# frozen_string_literal: true

RSpec.describe Mercadona::Error::Argument do
  it { expect(described_class).to be_const_defined(:DISCOUNT_CLASS) }
  it { expect(described_class).to be_const_defined(:COMPARISON_OPERATOR) }
  it { expect(described_class::COMPARISON_OPERATOR).to eq('condition: must be one of ==, <, >, >=, <=') }
  it { expect(described_class).to be < ::ArgumentError }
end
