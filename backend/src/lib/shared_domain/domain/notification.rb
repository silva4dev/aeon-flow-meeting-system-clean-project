# frozen_string_literal: true

module SharedDomain
  module Domain
    class Notification
      def initialize
        @errors = {}
      end

      def add_error(key, message)
        @errors[key] ||= []
        @errors[key] << message
        @errors[key].uniq!
      end

      def errors
        @errors.dup
      end

      def error_messages
        @errors.flat_map { |key, messages| messages.map { |msg| "#{key}: #{msg}" } }
      end

      def has_errors?
        @errors.any?
      end

      def clear
        @errors.clear
      end

      def merge!(other_notification)
        other_notification.errors.each do |field, messages|
          messages.each { |message| add_error(field, message) }
        end
        self
      end
    end
  end
end
