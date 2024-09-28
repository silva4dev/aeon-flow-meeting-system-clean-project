# frozen_string_literal: true

require 'dry-struct'

module SharedDomain
  module Domain
    class ValueObject < Dry::Struct::Value
      # A Value Object (Value Object) is a fundamental concept in Domain-Driven Design (DDD) and represents
      # an object that is defined exclusively by its attributes, that is, its identity is determined by the
      # value of its properties, and not by a identifier. single.

      def self.new(*args)
        super.tap { freeze }
      end

      def ==(other)
        other.is_a?(self.class) && attributes == other.attributes
      end
    end
  end
end
