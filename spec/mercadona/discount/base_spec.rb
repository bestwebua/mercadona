# frozen_string_literal: true

RSpec.describe Mercadona::Discount::Base do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:DISCOUNT_RULES_ATTRS) }
  end

  describe '.call' do
    subject(:abstract_base_class) do
      described_class.call(
        create(:discount_rule),
        create(:order_item),
        random_integer
      )
    end

    it 'raises runtime error' do
      expect { abstract_base_class }.to raise_exception(
        Mercadona::Error::Runtime,
        Mercadona::Error::Runtime::NOT_IMPLEMENTED
      )
    end
  end

  describe '#discount_case?' do
    subject(:discount_case) { described_class.new(discount_rule, order_item, order_item_quantity).send(:discount_case?) }

    let(:discount_rule) { create(:discount_rule, condition: '==', quantity: discount_rule_quantity) }
    let(:order_item) { create(:order_item) }
    let(:order_item_quantity) { random_integer }

    context 'when discount case' do
      let(:discount_rule_quantity) { order_item_quantity }

      it { is_expected.to be(true) }
    end

    context 'when not discount case' do
      let(:discount_rule_quantity) { order_item_quantity + 1 }

      it { is_expected.to be(false) }
    end
  end

  describe '#amount_without_discount' do
    subject(:amount_without_discount) do
      described_class.new(discount_rule, order_item, order_item_quantity).send(:amount_without_discount)
    end

    let(:discount_rule) { create(:discount_rule) }
    let(:order_item) { create(:order_item) }
    let(:order_item_quantity) { random_integer }

    it { is_expected.to eq(order_item.price_in_fractional_currency * order_item_quantity) }
  end
end
