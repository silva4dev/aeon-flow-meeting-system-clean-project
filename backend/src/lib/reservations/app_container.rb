# frozen_string_literal: true

require 'dry-auto_inject'

require_relative '../shared_domain/container'

module Reservations
  class AppContainer < SharedDomain::Container
    Inject = Dry::AutoInject(AppContainer)
  end
end
