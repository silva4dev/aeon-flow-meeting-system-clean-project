# frozen_string_literal: true

module SharedDomain
  module Domain
    module Errors
      class InvalidUuidError < StandardError
        def initialize(message)
          super(message)
        end
      end
    end
  end
end
