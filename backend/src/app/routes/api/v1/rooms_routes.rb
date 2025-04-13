# frozen_string_literal: true

require_relative '../../../../lib/rooms/application/usecases/create_room_usecase'

module App
  module Routes
    module API
      module V1
        module RoomsRoutes
          module_function

          def register(app)
            app.scope 'api/v1' do
              app.post '/rooms' do
                input = {
                  name: params[:name],
                  capacity: params[:capacity].to_i,
                  location: params[:location]
                }

                Rooms::Application::UseCases::CreateRoomUseCase.new.call(input) do |m|
                  m.success do |room|
                    status 201
                    json(
                      id: room.id.value,
                      name: room.name,
                      capacity: room.capacity,
                      location: room.location
                    )
                  end

                  m.failure do |message|
                    status 500
                    json({ errors: message })
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
