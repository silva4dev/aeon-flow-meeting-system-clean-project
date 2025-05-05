# frozen_string_literal: true

require 'bundler/setup'
require 'sequel'
require 'fileutils'

require_relative '../src/app/initializers/environment'

DB_DIR = File.expand_path('../../src/database', __dir__)
FileUtils.chmod(0777, DB_DIR) if File.exist?(DB_DIR)

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
