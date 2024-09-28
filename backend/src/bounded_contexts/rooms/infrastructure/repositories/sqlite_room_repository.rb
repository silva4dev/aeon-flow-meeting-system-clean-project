# frozen_string_literal: true

require_relative '../../application/repositories/room_repository'
require_relative '../mappers/room_mapper'

module Rooms
  module Infrastructure
    module Repositories
      class SqliteRoomRepository < Rooms::Application::Repositories::RoomRepository
        def initialize(rom)
          @rooms = rom.relations[:rooms]
        end

        def add(entity)
          @rooms.command(:create).call(
            id: entity.id,
            name: entity.name,
            capacity: entity.capacity,
            location: entity.location
          )
        end

        def all
         @rooms.to_a.map { |room| Mappers::RoomMapper.to_dao(room) }
        end
      end
    end
  end
end
