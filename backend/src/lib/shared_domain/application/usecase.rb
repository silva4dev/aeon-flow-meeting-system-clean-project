# frozen_string_literal: true

require 'dry-monads'

module SharedDomain
  module Application
    class UseCase
      # Use cases help capture the functional requirements of a system and understand
      # the desired behavior of the software from the user's perspective.

      include Dry::Monads[:result]

      def call(input_dto = {})
        raise NotImplementedError
      end
    end
  end
end
