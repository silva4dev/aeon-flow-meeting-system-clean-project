# frozen_string_literal: true

require_relative '../../../shared_domain/domain/entity'
require_relative '../../../shared_domain/domain/value_objects/uuid_value_object'
require_relative '../errors/room_validation_error'
require_relative '../validations/room_validation'

module Rooms
  module Domain
    module Entities
      class Room < SharedDomain::Domain::Entity
        attribute :name, SharedDomain::Domain::Types::String
        attribute :capacity, SharedDomain::Domain::Types::Integer
        attribute :location, SharedDomain::Domain::Types::String

        def initialize(attributes)
          room_validation = Validations::RoomValidation.new.call(attributes)
          raise Errors::RoomValidationError.new(room_validation.errors.to_h) unless room_validation.success?
          attributes[:id] = if attributes[:id].is_a?(String)
            SharedDomain::Domain::ValueObjects::UuidValueObject.new(value: attributes[:id])
          else
            SharedDomain::Domain::ValueObjects::UuidValueObject.new
          end
          super(attributes)
        end
      end
    end
  end
end
