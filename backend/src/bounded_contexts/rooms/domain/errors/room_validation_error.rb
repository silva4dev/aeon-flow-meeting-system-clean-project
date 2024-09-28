# frozen_string_literal: true

module Rooms
  module Domain
    module Errors
      class RoomValidationError < StandardError
        def initialize(errors)
          super("Room validation failed: #{errors}")
        end
      end
    end
  end
end
