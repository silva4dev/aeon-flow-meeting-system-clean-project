# frozen_string_literal: true

require_relative '../../../../lib/rooms/application/use_cases/create_room_use_case'

module App
  module Routes
    module API
      module V1
        module RoomsRoutes
          module_function

          def register(app)
            app.post '/api/v1/rooms' do
              input_dto = {
                name: params[:name],
                capacity: params[:capacity],
                location: params[:location]
              }

              Rooms::Application::UseCases::CreateRoomUseCase.new.call(input_dto) do |m|
                m.success do |room|
                  status 201
                  json(
                    id: room.id.value,
                    name: room.name,
                    capacity: room.capacity,
                    location: room.location
                  )
                end

                m.failure do |failure|
                  case failure[:status]
                  when :unprocessable_entity
                    status 422
                    json(errors: failure[:errors])
                  else
                    status 500
                    json(error: failure[:message])
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
