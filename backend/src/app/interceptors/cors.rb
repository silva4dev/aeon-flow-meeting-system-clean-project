# frozen_string_literal: true

module App
  module Interceptors
    class Cors
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        headers['access-control-allow-origin'] = '*'
        headers['access-control-allow-headers'] = '*'
        headers['access-control-allow-methods'] = '*'
        [status, headers, body]
      end
    end
  end
end
