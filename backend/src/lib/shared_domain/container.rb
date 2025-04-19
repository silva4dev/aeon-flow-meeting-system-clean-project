# frozen_string_literal: true

require 'dry-container'

require_relative '../../database/config/rom'
require_relative '../shared_domain/infrastructure/unit_of_work'

module SharedDomain
  class Container
    extend Dry::Container::Mixin

    namespace :infrastructure do
      register(:rom) { Database::Config::Rom.new }
      register(:unit_of_work) { SharedDomain::Infrastructure::UnitOfWork.new(Database::Config::Rom.new) }
    end
  end
end
