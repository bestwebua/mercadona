# frozen_string_literal: true

RSpec.describe Mercadona::Discount::Bulk do
  describe '.call' do
    subject(:amount) { described_class.call(discount_rule, order_item, order_item_quantity) }

    let(:discount_rule) { create(:discount_rule, :bulk_discount) }
    let(:order_item) { create(:order_item) }
    let(:order_item_price) { order_item.price_in_fractional_currency }
    let(:amount_without_discount) { order_item_price * order_item_quantity }

    context 'when discount case' do
      let(:order_item_quantity) { discount_rule.quantity }
      let(:expected_result) { amount_without_discount - (amount_without_discount * discount_rule.discount.to_f).round }

      include_examples 'calculates and returns the amount of the order items'
    end

    context 'when not discount case' do
      let(:order_item_quantity) { discount_rule.quantity - 1 }
      let(:expected_result) { amount_without_discount }

      include_examples 'calculates and returns the amount of the order items'
    end
  end
end
