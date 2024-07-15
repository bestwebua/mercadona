# frozen_string_literal: true

module Mercadona
  module Entity
    RSpec.shared_examples 'entity' do
      it { expect(described_class).to be < Mercadona::Entity::Base }

      it 'has the proper attributes' do
        expect(entity.attributes).to eq(attributes.keys)
        expect(entity).to eq(create(entity_type, **attributes))
      end
    end
  end
end
