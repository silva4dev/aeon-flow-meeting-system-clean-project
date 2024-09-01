# frozen_string_literal: true

require_relative '../../../../@shared/usecase'

module Rooms
  module Application
    module Usecases
      class CreateRoomUsecase < Usecase
        def call
          if true
            Success({ message: 'Room created successfully' })
          else
            Failure({ message: 'Failed to create room' })
          end
        end
      end
    end
  end
end
