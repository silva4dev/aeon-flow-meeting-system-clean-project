# frozen_string_literal: true

module SharedDomain
  module Infrastructure
    module Errors
      class InvalidTransactionError < StandardError
        def initialize(message = 'Invalid transaction operation')
          super(message)
        end
      end
    end
  end
end
