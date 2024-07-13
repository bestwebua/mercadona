# frozen_string_literal: true

RSpec.describe Mercadona::OrderItem do
  describe '.new' do
    subject(:order_item) { described_class.new(**attributes) }

    let(:attributes) { attributes_for(:order_item) }

    it 'has the proper attributes' do
      expect(order_item).to eq(create(:order_item, **attributes))
    end
  end
end
