# frozen_string_literal: true

require_relative '../../../../src/bounded_contexts/shared_domain/infrastructure/mapper'
require_relative '../../../../src/bounded_contexts/shared_domain/domain/entity'

RSpec.describe SharedDomain::Infrastructure::Mapper do
  before(:all) do
    class EntityFake < SharedDomain::Domain::Entity
      attribute :name, SharedDomain::Domain::Types::String
      attribute :age, SharedDomain::Domain::Types::Integer
    end

    class MapperFake < SharedDomain::Infrastructure::Mapper
      def self.to_entity(dao)
        EntityFake.new(
          name: dao[:name],
          age: dao[:age]
        )
      end

      def self.to_dao(entity)
        {
          name: entity.name,
          age: entity.age
        }
      end
    end
  end

  describe '.to_entity' do
    it 'converts a DAO hash to an entity hash' do
      dao = { name: 'John Doe', age: 40 }

      sut = MapperFake.to_entity(dao)

      expect(sut.name).to eq('John Doe')
      expect(sut.age).to eq(40)
    end
  end

  describe '.to_dao' do
    it 'converts an entity hash to a DAO hash' do
      entity = EntityFake.new(name: 'John Doe', age: 40)

      sut = MapperFake.to_dao(entity)

      expect(sut[:name]).to eq('John Doe')
      expect(sut[:age]).to eq(40)
    end
  end
end
