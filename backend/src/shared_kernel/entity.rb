# frozen_string_literal: true

require_relative './types'

class Entity < Dry::Struct
  attribute :id, Types::Integer.optional.default(nil)
end
