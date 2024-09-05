# frozen_string_literal: true

require 'dry-auto_inject'
require_relative '../../@shared/container'
require_relative './infrastructure/repositories/cassandra_room_repository'

module Rooms
  class AppContainer < Container
    namespace :rooms do
      register(:room_repository) {
        Infrastructure::Repositories::CassandraRoomRepository.new
      }
    end

    Inject = Dry::AutoInject(AppContainer)
  end
end
