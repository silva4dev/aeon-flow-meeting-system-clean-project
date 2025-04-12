# frozen_string_literal: true

require_relative '../../../../lib/rooms/application/usecases/create_room_usecase'

module App; end
module App::Routes; end
module App::Routes::API; end
module App::Routes::API::V1; end

module App::Routes::API::V1::RoomsRoutes
  module_function

  def register(app)
    app.scope 'api/v1' do
      app.post '/rooms' do
        input = {
          name: params[:name],
          capacity: params[:capacity],
          location: params[:location]
        }

        result = Rooms::Application::UseCases::CreateRoomUseCase.new.call(input)

        if result.success?
          room = result.value!
          status 201
          json(
            id: room.id.value,
            name: room.name,
            capacity: room.capacity,
            location: room.location
          )
        else
          status 422
          json(error: "Fail to create room.")
        end
      end
    end
  end
end
