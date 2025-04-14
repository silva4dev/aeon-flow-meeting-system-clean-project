# frozen_string_literal: true

require 'bundler/setup'
require 'debug'
require 'hanami/api'
require 'hanami/middleware/body_parser'

require_relative 'src/app/server'
require_relative 'src/app/interceptors/error_handler'

use App::Interceptors::ErrorHandler
use Hanami::Middleware::BodyParser, [:json]

run App::Server.new

