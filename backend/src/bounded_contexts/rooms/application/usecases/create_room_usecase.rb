# frozen_string_literal: true

require_relative '../../app_container'
require_relative '../../../../@shared/usecase'

module Rooms
  module Application
    module Usecases
      class CreateRoomUsecase < Usecase
        include Rooms::AppContainer::Inject[room_repository: "rooms.room_repository"]

        def call
          result = room_repository.add('Instance of Room Entity')

          if result.any?
            Success({ message: 'Successfully created room' })
          else
            Failure({ message: 'Failed to create room' })
          end
        end
      end
    end
  end
end
