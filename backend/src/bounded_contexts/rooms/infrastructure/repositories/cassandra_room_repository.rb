# frozen_string_literal: true

require_relative '../../application/repositories/room_repository'
require_relative '../mappers/room_mapper'

module Rooms
  module Infrastructure
    module Repositories
      class CassandraRoomRepository < Rooms::Application::Repositories::RoomRepository
        def add(room)
          Mappers::RoomMapper.to_dao(room)
        end
      end
    end
  end
end
