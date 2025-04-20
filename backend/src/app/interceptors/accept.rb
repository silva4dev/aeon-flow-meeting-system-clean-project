# frozen_string_literal: true

module App
  module Interceptors
    class Accept
      def initialize(app)
        @app = app
      end

      def call(env)
        status, headers, body = @app.call(env)
        headers['Accept'] = 'application/json' unless headers['Accept']
        [status, headers, body]
      end
    end
  end
end
