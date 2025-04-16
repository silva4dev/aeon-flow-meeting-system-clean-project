# frozen_string_literal: true

require_relative '../../../actions/create_room_action'

module App
  module Routes
    module API
      module V1
        module RoomsRoutes
          module_function

          def register(app)
            app.post '/api/v1/rooms' do
              action = App::Actions::CreateRoomAction.new
              result = action.call(params)
              status result[:status]
              json(result[:body])
            end
          end
        end
      end
    end
  end
end
