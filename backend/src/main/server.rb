# frozen_string_literal: true

require 'hanami/api'

class Server < Hanami::API
  get '/' do
    { message: 'Hello World!' }.to_json
  end
end
