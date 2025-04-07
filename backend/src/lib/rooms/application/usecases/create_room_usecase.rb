# frozen_string_literal: true

require_relative '../../app_container'
require_relative '../../../shared_domain/application/usecase'
require_relative '../../domain/entities/room_entity'

module Rooms
  module Application
    module UseCases
      class CreateRoomUseCase < SharedDomain::Application::UseCase
        def initialize
          @room_repository = Rooms::AppContainer.resolve('rooms.room_repository')
        end

        def call(input_dto = {})
          room = Domain::Entities::Room.new(
            name: input_dto[:name],
            capacity: input_dto[:capacity],
            location: input_dto[:location],
          )

          @room_repository.add(room)

          Success(room)
        end
      end
    end
  end
end
