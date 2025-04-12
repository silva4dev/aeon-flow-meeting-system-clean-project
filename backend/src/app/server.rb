# frozen_string_literal: true

require_relative 'middlewares/cors'
require_relative 'middlewares/content_type'
require_relative 'middlewares/accept'
require_relative 'routes/api/v1/rooms_routes'

module App
  class Server < Hanami::API
    def call(env)
      status, headers, body = super(env)
      App::Middlewares::Cors.call(headers)
      App::Middlewares::Accept.call(headers)
      App::Middlewares::ContentType.call(headers)
      [status, headers, body]
    end

    App::Routes::API::V1::RoomsRoutes.register(self)
  end
end
