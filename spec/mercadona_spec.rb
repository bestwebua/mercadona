# frozen_string_literal: true

RSpec.describe Mercadona do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:ALLOWED_COMPARISON_OPERATORS) }
  end

  describe 'integration' do
    let(:product_tea) { create(:order_item, :green_tea) }
    let(:product_strawberry) { create(:order_item, :strawberry) }
    let(:product_coffee) { create(:order_item, :coffee) }
    let(:checkout) do
      create_checkout(
        'GR1' => create(:discount_rule, :bogo_discount),
        'SR1' => create(:discount_rule, :quantity_discount),
        'CF1' => create(:discount_rule, :bulk_discount)
      )
    end

    context 'when BOGO (2 + 1) discount case' do
      subject(:amount_with_bogo_discount) { checkout.total }

      before do
        checkout.scan(product_tea)
        checkout.scan(product_strawberry)
        checkout.scan(product_tea)
        checkout.scan(product_tea)
        checkout.scan(product_coffee)
      end

      it { is_expected.to eq('£22.45') }
    end

    context 'when BOGO (1 + 1) discount case' do
      subject(:amount_with_bogo_discount) { checkout.total }

      before { 2.times { checkout.scan(product_tea) } }

      it { is_expected.to eq('£3.11') }
    end

    context 'when quantity discount case' do
      subject(:amount_with_quantity_discount) { checkout.total }

      before do
        checkout.scan(product_strawberry)
        checkout.scan(product_strawberry)
        checkout.scan(product_tea)
        checkout.scan(product_strawberry)
      end

      it { is_expected.to eq('£16.61') }
    end

    context 'when bulk discount case' do
      subject(:amount_with_bulk_discount) { checkout.total }

      before do
        checkout.scan(product_tea)
        checkout.scan(product_coffee)
        checkout.scan(product_strawberry)
        checkout.scan(product_coffee)
        checkout.scan(product_coffee)
      end

      it { is_expected.to eq('£30.57') }
    end
  end
end
