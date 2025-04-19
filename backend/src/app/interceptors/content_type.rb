# frozen_string_literal: true

module App
  module Interceptors
    class ContentType
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        return [status, headers, body] if body.first.nil?

        headers['Content-Type'] = 'application/json'
        [status, headers, body]
      end
    end
  end
end
