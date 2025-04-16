# frozen_string_literal: true

module SharedDomain
  module Web
    class Action
      def call(params = {})
        raise NotImplementedError
      end
    end
  end
end
