# frozen_string_literal: true

require_relative '../../../../@shared/validation'

module Rooms
  module Domain
    module Validations
      class RoomValidation < Dry::Validation::Contract
        params do
          required(:name).filled(:string)
          required(:capacity).filled(:integer, gt?: 0)
          required(:location).filled(:string)
        end
      end
    end
  end
end
