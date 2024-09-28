# frozen_string_literal: true

require_relative '../../app_container'
require_relative '../../../shared_domain/application/usecase'
require_relative '../../domain/entities/room'

module Rooms
  module Application
    module Usecases
      class CreateRoomUsecase < SharedDomain::Application::Usecase
        include Rooms::AppContainer::Inject[room_repository: 'rooms.room_repository']

        def call(input = {})
          room = Domain::Entities::Room.new(
            name: input[:name],
            capacity: input[:capacity],
            location: input[:location],
          )

          result = room_repository.add(room)

          Success(room)
        end
      end
    end
  end
end
