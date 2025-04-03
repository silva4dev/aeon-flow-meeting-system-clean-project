# frozen_string_literal: true

require 'dry-monads'

module SharedDomain
  module Application
    class Usecase
      # Use cases help capture the functional requirements of a system and understand
      # the desired behavior of the software from the user's perspective.

      include Dry::Monads[:result]

      def call(input = {})
        raise NotImplementedError
      end
    end
  end
end
