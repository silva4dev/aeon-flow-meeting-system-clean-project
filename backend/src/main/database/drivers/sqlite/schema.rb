# frozen_string_literal: true

module Database
  module Drivers
    module Sqlite
      class Schema
        def self.call(config)
          config.relation(:rooms) do
            schema(:rooms) do
              attribute :id, ROM::Types::String
              attribute :name, ROM::Types::String
              attribute :capacity, ROM::Types::Integer
              attribute :location, ROM::Types::String
            end
          end
        end
      end
    end
  end
end
