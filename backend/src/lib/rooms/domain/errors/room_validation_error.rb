# frozen_string_literal: true

module Rooms
  module Domain
    module Errors
      class RoomValidationError < StandardError
        attr_reader :notification

        def initialize(notification)
          @notification = notification
          super("Room validation failed: #{@notification.error_messages.join(', ')}")
        end
      end
    end
  end
end
