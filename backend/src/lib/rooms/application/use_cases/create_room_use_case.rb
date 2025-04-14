# frozen_string_literal: true

require 'dry/monads'
require 'dry/matcher'
require 'dry/matcher/result_matcher'

require_relative '../../app_container'
require_relative '../../../shared_domain/application/use_case'
require_relative '../../domain/entities/room_entity'
require_relative '../../domain/errors/room_validation_error'

module Rooms
  module Application
    module UseCases
      class CreateRoomUseCase < SharedDomain::Application::UseCase
        include Dry::Monads::Result::Mixin
        include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

        def initialize
          @room_repository = Rooms::AppContainer.resolve('rooms.room_repository')
        end

        def call(input_dto = {})
          room = Domain::Entities::Room.new(
            name: input_dto[:name],
            capacity: input_dto[:capacity],
            location: input_dto[:location]
          )

          @room_repository.add(room)

          Success(room)
        rescue Rooms::Domain::Errors::RoomValidationError => e
          Failure(
            status: :unprocessable_entity,
            errors: e.notification.errors,
            message: e.notification.error_messages.join(', ').to_s
          )
        rescue StandardError => e
          Failure(
            status: :internal_server_error,
            message: e.message
          )
        end
      end
    end
  end
end
