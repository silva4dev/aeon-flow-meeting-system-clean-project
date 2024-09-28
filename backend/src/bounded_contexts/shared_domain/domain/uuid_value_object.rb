# frozen_string_literal: true

require 'dry-struct'

require_relative '../../shared_domain/domain/types'

module SharedDomain
  module Domain
    class UuidValueObject < Dry::Struct
      attribute :value, Types::String

      def initialize(attributes = {})
        super(attributes)
        self.value ||= SecureRandom.uuid
        raise ArgumentError, 'Invalid UUID format' unless valid_uuid?(self.value)
      end

      private

      def valid_uuid?(uuid)
        uuid.is_a?(String) && uuid.match?(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
      end
    end
  end
end
