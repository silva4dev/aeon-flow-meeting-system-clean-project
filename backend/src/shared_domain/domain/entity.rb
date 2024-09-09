# frozen_string_literal: true

require_relative './types'

module SharedDomain
  module Domain
    class Entity < Dry::Struct
      attribute :id, Types::String.optional.default { SecureRandom.uuid }
    end
  end
end
