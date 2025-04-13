# frozen_string_literal: true

require 'dry/monads'
require 'dry/matcher'
require 'dry/matcher/result_matcher'

require_relative '../../app_container'
require_relative '../../../shared_domain/application/usecase'
require_relative '../../domain/entities/room_entity'

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
            capacity: input_dto[:capacity].to_i,
            location: input_dto[:location]
          )

          @room_repository.add(room)

          Success(room)
        rescue StandardError => e
          Failure(e.message)
        end
      end
    end
  end
end
