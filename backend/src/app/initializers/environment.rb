# frozen_string_literal: true

require 'dotenv'

module App
  module Initializers
    class Environment
      def initialize
        Dotenv.load(ENV['ENVIRONMENT'] == 'test' ? '.env.test' : '.env.dev')
      end
    end
  end
end

App::Initializers::Environment.new
