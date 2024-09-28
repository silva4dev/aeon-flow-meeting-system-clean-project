# frozen_string_literal: true

require 'dry-struct'

require_relative '../value_object'
require_relative '../errors/invalid_uuid_error'

module SharedDomain
  module Domain
    module ValueObjects
      class UuidValueObject < ValueObject
        attribute :value, Types::String.optional

        def initialize(attributes = {})
          attributes[:value] ||= SecureRandom.uuid
          super(attributes)
          raise Errors::InvalidUuidError.new('Invalid UUID format') unless valid_uuid?(value)
        end

        private

        def valid_uuid?(uuid)
          uuid.is_a?(String) && uuid.match?(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
        end
      end
    end
  end
end
