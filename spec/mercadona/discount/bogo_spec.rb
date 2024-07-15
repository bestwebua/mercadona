# frozen_string_literal: true

RSpec.describe Mercadona::Discount::Bogo do
  describe '.call' do
    subject(:amount) { described_class.call(discount_rule, order_item, order_item_quantity) }

    let(:discount_rule) { create(:discount_rule, :bogo_discount) }
    let(:order_item) { create(:order_item) }
    let(:order_item_price) { order_item.price_in_fractional_currency }

    context 'when discount case' do
      let(:expected_result) { (order_item_price * order_item_quantity) - order_item_price }

      context 'when the minimum quantity of order items to qualify for the discount' do
        let(:order_item_quantity) { discount_rule.quantity }

        include_examples 'calculates and returns the amount of the order items'
      end

      context 'when more then minimum quantity of order items to qualify for the discount' do
        let(:order_item_quantity) { discount_rule.quantity * 2 }

        include_examples 'calculates and returns the amount of the order items'
      end
    end

    context 'when not discount case' do
      let(:order_item_quantity) { discount_rule.quantity - 1 }
      let(:expected_result) { order_item_price * order_item_quantity }

      include_examples 'calculates and returns the amount of the order items'
    end
  end
end
