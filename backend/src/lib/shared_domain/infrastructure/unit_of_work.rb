# frozen_string_literal: true

require_relative 'errors/invalid_transaction_error'

module SharedDomain
  module Infrastructure
    class UnitOfWork
      def initialize(rom)
        @rom = rom
      end

      def transaction(relation_name, &)
        @rom[relation_name].transaction do |t|
          yield t
        rescue StandardError => e
          t.rollback!
          raise Errors::InvalidTransactionError, "Transaction error: #{e.message}"
        end
        yield
      end
    end
  end
end
