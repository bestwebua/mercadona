# frozen_string_literal: true

RSpec.describe Mercadona::AmountFormatter do
  describe '.call' do
    subject(:formatter) { described_class.call(currency, amount) }

    let(:currency) { '$' }

    context 'when amount is an integer' do
      let(:amount) { random_integer }

      it { is_expected.to eq("#{currency}#{amount}.00") }
    end

    context 'when amount is an float with zero' do
      let(:amount) { 42.0 }

      it { is_expected.to eq("#{currency}#{amount}0") }
    end

    context 'when amount is a decimal fraction with whole tens' do
      let(:amount) { 42.1 }

      it { is_expected.to eq("#{currency}#{amount}0") }
    end

    context 'when amount is a decimal fraction with more than two characters after the period' do
      let(:amount) { 42.1234 }

      it { is_expected.to eq("#{currency}#{amount.round(2)}") }
    end
  end
end
