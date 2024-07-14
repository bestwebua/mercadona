# frozen_string_literal: true

RSpec.describe Mercadona::DiscountResolver do
  describe '.call' do
    subject(:discount_resolver) { described_class.call(discount_rules, order_item, quantity) }

    let(:quantity) { 1 }
    let(:order_item) { create(:order_item) }
    let(:order_item_rule) { 'some_rules' }
    let(:discount_rules) { { order_item.product_code => [:base, 'some_rules'] } }

    it 'calls target discount class mapped by order item product_code' do
      expect(Mercadona::DiscountType::Base).to receive(:call).with([order_item_rule], order_item, quantity)
      discount_resolver
    end
  end
end
