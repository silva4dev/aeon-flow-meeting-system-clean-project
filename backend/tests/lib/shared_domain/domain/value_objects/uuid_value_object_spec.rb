# frozen_string_literal: true

require_relative '../../../../../src/lib/shared_domain/domain/value_objects/uuid_value_object'
require_relative '../../../../../src/lib/shared_domain/domain/errors/invalid_uuid_error'

RSpec.describe SharedDomain::Domain::ValueObjects::UuidValueObject do
  let(:valid_uuid) { SecureRandom.uuid }
  let(:invalid_uuid) { 'invalid-uuid' }

  describe '#initialize' do
    context 'when initialized with a valid UUID' do
      it 'sets the value correctly' do
        sut = described_class.new(value: valid_uuid)
        expect(sut.value).to eq(valid_uuid)
      end
    end

    context 'when initialized with nil' do
      it 'generates a new UUID' do
        sut = described_class.new(value: nil)
        expect(sut.value).to be_a(String)
        expect(sut.value).to match(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
      end
    end

    context 'when initialized with an invalid UUID' do
      it 'raises an ArgumentError' do
        expect { described_class.new(value: invalid_uuid) }.to raise_error(SharedDomain::Domain::Errors::InvalidUuidError, 'Invalid UUID format')
      end
    end
  end
end
