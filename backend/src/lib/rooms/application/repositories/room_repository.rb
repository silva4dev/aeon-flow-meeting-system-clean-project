# frozen_string_literal: true

module Rooms
  module Application
    module Repositories
      class RoomRepository
        def add(entity)
          raise NotImplementedError
        end

        def find_all
          raise NotImplementedError
        end
      end
    end
  end
end
