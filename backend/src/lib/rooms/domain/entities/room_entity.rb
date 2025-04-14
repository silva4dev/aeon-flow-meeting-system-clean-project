# frozen_string_literal: true

require_relative '../../../shared_domain/domain/entity'
require_relative '../../../shared_domain/domain/value_objects/uuid_value_object'
require_relative '../errors/room_validation_error'
require_relative '../validations/room_validation'

module Rooms
  module Domain
    module Entities
      class Room < SharedDomain::Domain::Entity
        attribute :name, SharedDomain::Domain::Types::Strict::String
        attribute :capacity, SharedDomain::Domain::Types::Strict::Integer
        attribute :location, SharedDomain::Domain::Types::Strict::String

        extend(Module.new do
          def new(attributes)
            notification = Rooms::Domain::Validations::RoomValidation.new.validate_attributes(attributes)
            raise Rooms::Domain::Errors::RoomValidationError, notification if notification.has_errors?

            super
          end
        end)

        def initialize(attributes)
          attributes[:id] = if attributes[:id].is_a?(String)
                              SharedDomain::Domain::ValueObjects::UuidValueObject.new(value: attributes[:id])
                            else
                              SharedDomain::Domain::ValueObjects::UuidValueObject.new
                            end
          super
        end
      end
    end
  end
end
