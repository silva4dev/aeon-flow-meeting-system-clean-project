# frozen_string_literal: true

require_relative '../../../src/shared_domain/domain/types'
require_relative '../../../src/shared_domain/domain/value_object'

RSpec.describe SharedDomain::Domain::ValueObject do
  before(:all) do
    class ValueObjectFake < SharedDomain::Domain::ValueObject
      attribute :name, SharedDomain::Domain::Types::String
      attribute :age, SharedDomain::Domain::Types::Integer
    end
  end

  context 'when initialized with valid attributes' do
    let(:sut) { ValueObjectFake.new(name: 'John Doe', age: 20) }

    it 'has the correct name' do
      expect(sut.name).to eq('John Doe')
    end

    it 'has the correct age' do
      expect(sut.age).to eq(20)
    end
  end

  context 'when initialized with invalid attributes' do
    it 'raises an error for missing name' do
      expect { ValueObjectFake.new(age: 30) }.to raise_error(Dry::Struct::Error, /:name is missing/)
    end

    it 'raises an error for missing age' do
      expect { ValueObjectFake.new(name: 'John Doe') }.to raise_error(Dry::Struct::Error, /:age is missing/)
    end
  end
end
