# frozen_string_literal: true

require_relative '../../../shared_domain/domain/entity'
require_relative '../../../shared_domain/domain/value_objects/uuid_value_object'

module Reservations
  module Domain
    module Entities
      class Reservation < SharedDomain::Domain::Entity
        def initialize(attributes)
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
