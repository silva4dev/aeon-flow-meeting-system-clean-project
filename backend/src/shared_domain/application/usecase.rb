# frozen_string_literal: true

require 'dry-monads'

module SharedDomain
  module Application
    class Usecase
      include Dry::Monads[:result]

      def call
        raise NotImplementedError
      end
    end
  end
end
