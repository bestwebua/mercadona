# frozen_string_literal: true

RSpec.describe Mercadona::Discount::Base do
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
end
