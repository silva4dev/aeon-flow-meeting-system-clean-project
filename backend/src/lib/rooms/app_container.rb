# frozen_string_literal: true

require 'dry-auto_inject'

require_relative '../shared_domain/container'
require_relative '../../config/rom'
require_relative 'infrastructure/repositories/sqlite_room_repository'

module Rooms
  class AppContainer < SharedDomain::Container
    namespace :config do
      register(:rom) { Config::Rom.new }
    end

    namespace :rooms do
      register(:room_repository) { Infrastructure::Repositories::SqliteRoomRepository.new }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end
