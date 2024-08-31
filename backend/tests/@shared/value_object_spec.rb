# frozen_string_literal: true

require_relative '../../src/@shared/types'
require_relative '../../src/@shared/value_object'

RSpec.describe ValueObject do
  before(:all) do
    class ValueObjectFake < ValueObject
      attribute :name, Types::String
      attribute :age, Types::Integer
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
