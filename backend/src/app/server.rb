# frozen_string_literal: true

require_relative 'interceptors/cors'
require_relative 'interceptors/content_type'
require_relative 'interceptors/accept'
require_relative 'routes/api/v1/rooms_routes'

module App
  class Server < Hanami::API
    def call(env)
      status, headers, body = super(env)
      App::Interceptors::Cors.call(headers)
      App::Interceptors::Accept.call(headers)
      App::Interceptors::ContentType.call(headers)
      [status, headers, body]
    end

    App::Routes::API::V1::RoomsRoutes.register(self)
  end
end
