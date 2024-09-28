# frozen_string_literal: true

module Database
  module Drivers
    module Sqlite
      class Migrations
        def self.call(config)
          config.default.connection.create_table?(:rooms) do
            column :id, String, primary_key: true
            column :name, String, null: false
            column :capacity, Integer, null: false
            column :location, String, null: false
          end
        end
      end
    end
  end
end
