# frozen_string_literal: true

RSpec.describe Mercadona::Entity::DiscountRule do
  describe '.new' do
    subject(:entity) { described_class.new(**attributes) }

    let(:entity_type) { :discount_rule }
    let(:attributes) { attributes_for(entity_type) }

    it_behaves_like 'entity'
  end

  describe '#amount_with_discount' do
    subject(:amount_with_discount) { entity.amount_with_discount(order_item, order_item_quantity) }

    let(:expected_result) { random_integer }
    let(:type) { class_double('SomeDiscountType', call: expected_result) }
    let(:order_item) { create(:order_item) }
    let(:order_item_quantity) { random_integer }
    let(:entity) { create(:discount_rule, type: type) }

    it { is_expected.to eq(expected_result) }
  end
end
