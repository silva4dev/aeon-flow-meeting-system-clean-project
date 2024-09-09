# frozen_string_literal: true

require 'dry-auto_inject'
require_relative '../../shared_domain/container'
require_relative './infrastructure/repositories/pg_room_repository'

module Rooms
  class AppContainer < SharedDomain::Container
    namespace :rooms do
      register(:room_repository) {
        Infrastructure::Repositories::PgRoomRepository.new
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end
