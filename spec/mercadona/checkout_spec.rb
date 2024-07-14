# frozen_string_literal: true

RSpec.describe Mercadona::Checkout do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:DEFAULT_CURRENCY) }
    it { expect(described_class).to be_const_defined(:INITIAL_AMOUNT) }
  end

  describe '#total' do
    subject(:checkout_total) { checkout.total }

    let(:checkout) { described_class.new(discount_rules) }
    let(:product_tea) { create(:order_item, :green_tea) }
    let(:product_strawberry) { create(:order_item, :strawberry) }
    let(:product_coffee) { create(:order_item, :coffee) }

    before do
      checkout.scan(product_tea)
      checkout.scan(product_strawberry)
      checkout.scan(product_coffee)
    end

    context 'when order items without a discount' do
      let(:discount_rules) { {} }
      let(:expected_amount) { product_tea.price + product_strawberry.price + product_coffee.price }

      it 'returns amount for all order items without a discount' do
        expect(Mercadona::DiscountResolver).not_to receive(:call)
        expect(Mercadona::AmountFormatter)
          .to receive(:call)
          .with(
            Mercadona::Checkout::DEFAULT_CURRENCY,
            expected_amount
          )
          .and_call_original
        expect(checkout_total).to eq("#{Mercadona::Checkout::DEFAULT_CURRENCY}#{expected_amount}")
      end
    end

    context 'when order items with a discount' do
      let(:discount_rules) { { product_coffee.product_code => [] } }
      let(:discount_items_amount) { 42.0 }
      let(:expected_amount) { product_tea.price + product_strawberry.price + discount_items_amount }

      it 'returns amount for all order items using discount for certain items' do
        expect(Mercadona::DiscountResolver)
          .to receive(:call)
          .with(
            discount_rules,
            product_coffee,
            1
          )
          .and_return(discount_items_amount)
        expect(Mercadona::AmountFormatter)
          .to receive(:call)
          .with(
            Mercadona::Checkout::DEFAULT_CURRENCY,
            expected_amount
          )
          .and_call_original
        expect(checkout_total).to eq("#{Mercadona::Checkout::DEFAULT_CURRENCY}#{expected_amount}")
      end
    end
  end
end
