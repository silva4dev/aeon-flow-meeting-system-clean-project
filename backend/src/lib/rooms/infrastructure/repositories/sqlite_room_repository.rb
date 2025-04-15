# frozen_string_literal: true

require_relative '../../app_container'
require_relative '../../application/repositories/room_repository'
require_relative '../mappers/room_mapper'

module Rooms
  module Infrastructure
    module Repositories
      class SqliteRoomRepository < Rooms::Application::Repositories::RoomRepository
        def initialize
          @rom = Rooms::AppContainer.resolve('config.rom')
          super
        end

        def add(entity)
          @rom[:rooms].command(:create).call(
            id: entity.id.value,
            name: entity.name,
            capacity: entity.capacity,
            location: entity.location
          )
        end

        def find_all
          @rom[:rooms].to_a.map { |room| to_dao(room) }
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
