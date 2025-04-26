# frozen_string_literal: true

require 'bundler/setup'
require 'sequel'
require 'fileutils'

ENV['ENVIRONMENT'] ||= 'test'

DB_DIR = File.expand_path('../../src/database', __dir__)
DB_PATH = File.join(DB_DIR, 'database_test.sqlite3')

DB = Sequel.connect("sqlite://#{DB_PATH}")

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.pattern = 'tests/**/*_spec.rb'
end
