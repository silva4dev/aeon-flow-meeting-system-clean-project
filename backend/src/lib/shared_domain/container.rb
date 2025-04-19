# frozen_string_literal: true

require 'dry-container'

require_relative 'infrastructure/rom'
require_relative '../shared_domain/infrastructure/unit_of_work'

module SharedDomain
  class Container
    extend Dry::Container::Mixin

    namespace :infrastructure do
      register(:rom) { SharedDomain::Infrastructure::Rom.new }
      register(:unit_of_work) do
        rom = SharedDomain::Infrastructure::Rom.new
        SharedDomain::Infrastructure::UnitOfWork.new(rom)
      end
    end
  end
end
