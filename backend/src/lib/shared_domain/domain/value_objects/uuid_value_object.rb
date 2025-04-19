# frozen_string_literal: true

require 'uuid'

require_relative '../value_object'
require_relative '../types'
require_relative '../errors/invalid_uuid_error'

module SharedDomain
  module Domain
    module ValueObjects
      class UuidValueObject < ValueObject
        attribute :value, SharedDomain::Domain::Types::String.optional.default(nil)

        def initialize(attributes = {})
          attributes[:value] ||= UUID.new.generate
          raise Errors::InvalidUuidError.new('Invalid UUID format') unless valid_uuid?(value)
          super(attributes)
        end

        private

        def valid_uuid?(uuid)
          uuid.is_a?(String) && uuid.match?(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
        end
      end
    end
  end
end
