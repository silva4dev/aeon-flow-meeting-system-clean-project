# frozen_string_literal: true

module App
  module Interceptors
    class Cors
      def self.call(headers)
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Headers'] = '*'
        headers['Access-Control-Allow-Methods'] = '*'
      end
    end
  end
end
