# frozen_string_literal: true

require_relative '../lib/rooms/application/usecases/create_room_usecase'

module App
  class Server < Hanami::API
    scope "api" do
      scope "v1" do
        post "/rooms" do
          input_dto = {
            name: params[:name],
            capacity: params[:capacity],
            location: params[:location]
          }

          result = Rooms::Application::UseCases::CreateRoomUseCase.new.call(input_dto)

          if result.success?
            status 201
            json({
              id: result.value!.id.value,
              name: result.value!.name,
              capacity: result.value!.capacity,
              location: result.value!.location
            })
          else
            status 422
            json(error: "Fail to create room.")
          end
        end
      end
    end
  end
end
