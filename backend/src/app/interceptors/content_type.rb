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

        headers['Content-Type'] = 'application/json' unless headers['Content-Type']
        [status, headers, body]
      end
    end
  end
end
