# frozen_string_literal: true

module App
  module Middlewares
    class Accept
      def self.call(headers)
        headers['Accept'] = 'application/json'
      end
    end
  end
end
