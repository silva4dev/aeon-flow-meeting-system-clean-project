# frozen_string_literal: true

module Rooms
  module Infrastructure
    module Mappers
      class RoomMapper
        def self.to_dao(entity)
          {
            id: entity.id,
            name: entity.name,
            capacity: entity.capacity,
            location: entity.location
          }
        end
      end
    end
  end
end
