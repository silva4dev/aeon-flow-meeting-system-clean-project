# frozen_string_literal: true

class Entity < Dry::Struct
  attribute :id, Types::Integer.optional.default(nil)
end
