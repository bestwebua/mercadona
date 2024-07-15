# frozen_string_literal: true

RSpec.describe Mercadona::Entity::DiscountRule do
  describe '.new' do
    subject(:entity) { described_class.new(**attributes) }

    let(:invalid_arguments) { {} }
    let(:attributes) { attributes_for(entity_type).merge(invalid_arguments) }
    let(:entity_type) { :discount_rule }

    context 'with valid arguments' do
      it_behaves_like 'entity'
    end

    shared_examples 'raises an argument error' do
      it 'raises Mercadona::Error::Argument error' do
        expect { entity }.to raise_exception(
          Mercadona::Error::Argument,
          error_message
        )
      end
    end

    context 'when invalid discount type class argument' do
      let(:error_message) { Mercadona::Error::Argument::DISCOUNT_CLASS }
      let(:invalid_arguments) { { type: 42 } }

      include_examples 'raises an argument error'
    end

    context 'when invalid condition argument' do
      let(:invalid_arguments) { { condition: 42 } }
      let(:error_message) { Mercadona::Error::Argument::COMPARISON_OPERATOR }

      include_examples 'raises an argument error'
    end
  end

  describe '#amount_with_discount' do
    subject(:amount_with_discount) { entity.amount_with_discount(order_item, order_item_quantity) }

    let(:expected_result) { random_integer }
    let(:type) { create_dummy_discount_type(expected_result) }
    let(:order_item) { create(:order_item) }
    let(:order_item_quantity) { random_integer }
    let(:entity) { create(:discount_rule, type: type) }

    it { is_expected.to eq(expected_result) }
  end
end
