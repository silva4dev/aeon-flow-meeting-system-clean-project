# frozen_string_literal: true

require_relative '../../../../shared_kernel/validation'

class RoomValidation < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
    required(:capacity).filled(:integer, gt?: 0)
    required(:location).filled(:string)
  end
end
