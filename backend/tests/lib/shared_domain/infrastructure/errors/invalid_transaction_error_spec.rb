# frozen_string_literal: true

require_relative '../../../../../src/lib/shared_domain/infrastructure/errors/invalid_transaction_error'

RSpec.describe SharedDomain::Infrastructure::Errors::InvalidTransactionError do
  describe '#initialize' do
    context 'when no message is provided' do
      it 'uses the default error message' do
        sut = described_class.new
        expect(sut.message).to eq('Invalid transaction operation')
      end
    end

    context 'when a custom message is provided' do
      let(:custom_message) { 'Custom error message' }

      it 'uses the provided message' do
        sut = described_class.new(custom_message)
        expect(sut.message).to eq(custom_message)
      end
    end

    it 'is a kind of StandardError' do
      expect(described_class.new).to be_a(StandardError)
    end
  end
end
