# frozen_string_literal: true

module SharedDomain
  module Infrastructure
    class UnitOfWork
      def transaction(&_block)
        raise NotImplementedError
      end
    end
  end
end
