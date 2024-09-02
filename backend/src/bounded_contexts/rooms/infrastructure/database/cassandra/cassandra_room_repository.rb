# frozen_string_literal: true

require_relative '../../../application/repositories/room_repository'

module Rooms
  module Infrastructure
    module Database
      module Cassandra
        class CassandraRoomRepository < Rooms::Application::Repositories::RoomRepository
          def add(room)
            { id: 1, name: 'Conference', capacity: 10, location: 'Room 4' }
          end
        end
      end
    end
  end
end
