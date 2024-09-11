# frozen_string_literal: true

require_relative '../validations/room_validation'
require_relative '../../../shared_domain/domain/entity'

module Rooms
  module Domain
    module Entities
      class Room < SharedDomain::Domain::Entity
        attribute :name, SharedDomain::Domain::Types::String
        attribute :capacity, SharedDomain::Domain::Types::Integer
        attribute :location, SharedDomain::Domain::Types::String

        def initialize(attributes)
          room_validation = Validations::RoomValidation.new.call(attributes)
          raise ArgumentError, room_validation.errors.to_h unless room_validation.success?
          super(attributes)
        end
      end
    end
  end
end
