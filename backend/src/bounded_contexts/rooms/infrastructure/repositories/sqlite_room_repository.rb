# frozen_string_literal: true

require_relative '../../application/repositories/room_repository'
require_relative '../mappers/room_mapper'

module Rooms
  module Infrastructure
    module Repositories
      class SqliteRoomRepository < Rooms::Application::Repositories::RoomRepository
        def initialize(rom)
          @rom = rom
          @rooms = @rom.relations[:rooms]
        end

        def add(entity)
          @rooms.command(:create).call(
            id: entity.id,
            name: entity.name,
            capacity: entity.capacity,
            location: entity.location
          )
        end

        def find_all
          @rooms.to_a.map { |room| Mappers::RoomMapper.to_dao(room) }
        end

        private

        def to_entity(dao)
          Mappers::RoomMapper.to_entity(dao)
        end

        def to_dao(entity)
          Mappers::RoomMapper.to_dao(entity)
        end
      end
    end
  end
end
