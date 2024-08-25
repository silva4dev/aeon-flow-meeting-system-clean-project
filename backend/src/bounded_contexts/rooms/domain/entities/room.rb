# frozen_string_literal: true

require_relative '../../../../shared_kernel/entity'

class Room < Entity
  attribute :name, Types::String
  attribute :capacity, Types::Integer
  attribute :location, Types::String
end
