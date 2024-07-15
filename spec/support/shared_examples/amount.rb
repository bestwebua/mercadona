# frozen_string_literal: true

RSpec.shared_examples 'calculates and returns the amount of the order items' do
  it { expect(described_class).to be < Mercadona::Discount::Base }

  it 'calculates and returns the amount of the order items' do
    expect(amount).to eq(expected_result)
  end
end
