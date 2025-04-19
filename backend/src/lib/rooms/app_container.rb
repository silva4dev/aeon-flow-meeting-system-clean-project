# frozen_string_literal: true

require 'dry-auto_inject'

require_relative '../shared_domain/container'
require_relative 'infrastructure/repositories/sqlite_room_repository'

module Rooms
  class AppContainer < SharedDomain::Container
    namespace :rooms do
      namespace :infrastructure do
        register(:room_repository) { Rooms::Infrastructure::Repositories::SqliteRoomRepository.new }
      end
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end
