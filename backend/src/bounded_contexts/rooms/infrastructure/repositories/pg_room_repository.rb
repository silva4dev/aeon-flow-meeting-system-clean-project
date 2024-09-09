# frozen_string_literal: true

require_relative '../../application/repositories/room_repository'
require_relative '../../../../shared_domain/infrastructure/pg_persistence_helper'

module Rooms
  module Infrastructure
    module Repositories
      class PgRoomRepository < Rooms::Application::Repositories::RoomRepository
        def add(room)
          query = 'INSERT INTO rooms (name, capacity, location) VALUES ($1, $2, $3) RETURNING *'
          data = SharedDomain::Infrastructure::PgPersistenceHelper.instance.execute(query, [room.name, room.capacity, room.location])
          return data
        end
      end
    end
  end
end
