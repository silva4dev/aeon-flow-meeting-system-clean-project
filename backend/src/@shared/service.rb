# frozen_string_literal: true

require 'dry-monads'

class Service
  include Dry::Monads[:result]

  def call
    raise NotImplementedError
  end
end
