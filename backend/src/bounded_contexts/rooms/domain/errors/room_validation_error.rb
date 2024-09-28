# frozen_string_literal: true

module Rooms
  module Domain
    module Errors
      class RoomValidationError < StandardError
        def initialize(messages)
          super("Room validation failed: #{messages}")
        end
      end
    end
  end
end
