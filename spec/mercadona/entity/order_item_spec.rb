# frozen_string_literal: true

RSpec.describe Mercadona::Entity::OrderItem do
  describe '.new' do
    subject(:entity) { described_class.new(**attributes) }

    let(:entity_type) { :order_item }
    let(:attributes) { attributes_for(entity_type) }

    it_behaves_like 'entity'
  end
end
