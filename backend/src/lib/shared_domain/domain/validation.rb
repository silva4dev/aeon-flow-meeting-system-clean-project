# frozen_string_literal: true

require 'dry-validation'

module SharedDomain
  module Domain
    class Validation < Dry::Validation::Contract
      # Here you can define common rules if there are any
      # e.g. generic string rules, email format, etc.
    end
  end
end
