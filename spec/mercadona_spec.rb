# frozen_string_literal: true

RSpec.describe Mercadona do
  describe 'defined constants' do
    it { expect(described_class).to be_const_defined(:ALLOWED_COMPARISON_OPERATORS) }
  end
end
