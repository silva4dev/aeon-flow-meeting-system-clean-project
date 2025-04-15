# frozen_string_literal: true

module SharedDomain
  module Infrastructure
    class UnitOfWork
      def initialize(rom_container)
        @rom = rom_container
        @transaction = nil
      end
    end
  end
end
