# frozen_string_literal: true

module App
  module Middlewares
    class ContentType
      def self.call(headers)
        headers['Content-Type'] = 'application/json'
      end
    end
  end
end
