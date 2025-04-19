# frozen_string_literal: true

require_relative 'routes/api/v1/rooms_routes'

module App
  class Server < Hanami::API
    App::Routes::API::V1::RoomsRoutes.register(self)
  end
end
