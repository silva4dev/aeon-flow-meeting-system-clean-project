# frozen_string_literal: true

require_relative '../../app_container'
require_relative '../../../shared_domain/application/usecase'
require_relative '../../domain/entities/room_entity'

module Rooms
  module Application
    module UseCases
      class CreateRoomUseCase < SharedDomain::Application::UseCase
        include Rooms::AppContainer::Inject[room_repository: 'rooms.room_repository']

        def call(input_dto = {})
          room = Domain::Entities::Room.new(
            name: input_dto[:name],
            capacity: input_dto[:capacity],
            location: input_dto[:location],
          )

          room_repository.add(room)

          Success(room)
        end
      end
    end
  end
end
