# frozen_string_literal: true

require_relative 'types'

module SharedDomain
  module Domain
    class Entity < Dry::Struct
      # Entity is a fundamental concept in Domain-Driven Design (DDD), which refers to
      # an object that has a unique identity and is defined by its properties and behaviors.

      attribute :id, SharedDomain::Domain::Types::String.optional.default(nil)
    end
  end
end
