# frozen_string_literal: true

module App
  module Interceptors
    class ErrorHandler
      def initialize(app)
        @app = app
      end

      def call(env)
        @app.call(env)
      rescue Hanami::Middleware::BodyParser::BodyParsingError
        [400, { 'Content-Type' => 'application/json' }, [
          {
            message: 'Invalid JSON format'
          }.to_json
        ]]
      rescue StandardError
        [500, { 'Content-Type' => 'application/json' }, [
          {
            message: 'Something went wrong'
          }.to_json
        ]]
      end
    end
  end
end
