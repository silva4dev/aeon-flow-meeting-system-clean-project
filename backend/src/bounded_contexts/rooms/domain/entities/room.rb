# frozen_string_literal: true

require_relative '../validations/room_validation'
require_relative '../../../../@shared/entity'

module Rooms
  module Domain
    module Entities
      class Room < Entity
        attribute :name, Types::String
        attribute :capacity, Types::Integer
        attribute :location, Types::String

        def initialize(attributes)
          room_validation = Validations::RoomValidation.new.call(attributes)
          raise ArgumentError, room_validation.errors.to_h unless room_validation.success?
          super(attributes)
        end
      end
    end
  end
end
