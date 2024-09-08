# frozen_string_literal: true

require 'cassandra'
require 'singleton'

class CassandraPersistence
  include Singleton

  def initialize
    @cluster = nil
    @session = nil
    @connection_params = nil
  end

  # Método para conectar ao Cassandra
  def connect(hosts: ['127.0.0.1'], keyspace: nil, username: nil, password: nil)
    @connection_params = {
      hosts:,
      username:,
      password:,
      keyspace:
    }.compact

    @cluster = Cassandra.cluster(@connection_params)
    @session = keyspace ? @cluster.connect(keyspace) : @cluster.connect
  rescue Cassandra::Errors::NoHostsAvailable => e
    handle_error(e, 'Error connecting to the Cassandra cluster.')
    raise e
  end

  def disconnect
    @cluster&.close
    @cluster = nil
    @session = nil
  end

  def execute(query, params = [])
    connect unless connected?
    @session.execute(query, arguments: params)
  rescue Cassandra::Errors::QueryError => e
    handle_error(e, 'Error executing the query.')
    raise e
  end

  def connected?
    !(@cluster.nil? || @session.nil?)
  end

  private

  def handle_error(error, message)
    puts "#{message} #{error.message}"
  end
end
