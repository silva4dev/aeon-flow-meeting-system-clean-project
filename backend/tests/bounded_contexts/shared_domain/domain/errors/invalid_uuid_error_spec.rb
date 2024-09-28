# frozen_string_literal: true

require_relative '../../../../../src/bounded_contexts/shared_domain/domain/errors/invalid_uuid_error'

RSpec.describe SharedDomain::Domain::Errors::InvalidUuidError do
  describe '#initialize' do
    context 'when initialized with a custom message' do
      it 'sets the message correctly' do
        error_message = "Custom error message"
        sut = described_class.new(error_message)

        expect(sut.message).to eq(error_message)
      end
    end

    context 'when initialized with a default message' do
      it 'sets the message correctly' do
        sut = described_class.new("Some error message")

        expect(sut.message).to eq("Some error message")
      end
    end
  end
end
