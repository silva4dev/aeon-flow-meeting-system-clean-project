# frozen_string_literal: true

require 'hanami/api'

module External
  module Server
    class Main < Hanami::API
      get '/' do
        { message: 'Hello World!' }.to_json
      end
    end
  end
end
