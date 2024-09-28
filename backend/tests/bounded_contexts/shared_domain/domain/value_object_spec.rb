# frozen_string_literal: true

require_relative '../../../../src/bounded_contexts/shared_domain/domain/types'
require_relative '../../../../src/bounded_contexts/shared_domain/domain/value_object'

RSpec.describe SharedDomain::Domain::ValueObject do
  before(:all) do
    class CpfFake < SharedDomain::Domain::ValueObject
      attribute :value, SharedDomain::Domain::Types::String
    end
  end

  context 'when initialized with valid attributes' do
    let(:sut) { CpfFake.new(value: '142.432.132-12') }

    it 'has the correct value' do
      expect(sut.value).to eq('142.432.132-12')
    end
  end

  context 'when initialized with invalid attributes' do
    it 'raises an error for missing value' do
      expect { CpfFake.new }.to raise_error(Dry::Struct::Error, /:value is missing/)
    end
  end
end
