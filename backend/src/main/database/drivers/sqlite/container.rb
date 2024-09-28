# frozen_string_literal: true

require 'rom'
require 'rom-sql'

require_relative './migrations.rb'
require_relative './schema'

module Database
  module Drivers
    module Sqlite
      class Container
        DATABASE_PATH = File.expand_path('../../../../../database.db', __dir__)

        def self.setup
          ROM.container(:sql, "sqlite://#{DATABASE_PATH}") do |config|
            Migrations.call(config)
            Schema.call(config)
          end
        end
      end
    end
  end
end
