# frozen_string_literal: true

require_relative '../../../../src/bounded_contexts/shared_domain/infrastructure/pg_persistence_helper'

RSpec.describe SharedDomain::Infrastructure::PgPersistenceHelper do
  let(:connection_params) do
    {
      dbname: 'test_db',
      user: 'test_user',
      password: 'test_password',
      host: 'localhost',
      port: 5432
    }
  end

  let(:pg_connection) { instance_double(PG::Connection) }

  before do
    SharedDomain::Infrastructure::PgPersistenceHelper.instance_variable_set(:@pg_connection, nil)
    SharedDomain::Infrastructure::PgPersistenceHelper.instance_variable_set(:@connection_params, connection_params)
  end

  subject { SharedDomain::Infrastructure::PgPersistenceHelper.instance }

  describe '#connect' do
    it 'establishes a connection to the PostgreSQL database' do
      expect(PG).to receive(:connect).with(connection_params).and_return(pg_connection)

      subject.connect(**connection_params)
      expect(subject.instance_variable_get(:@pg_connection)).to eq(pg_connection)
    end

    it 'raises an error if the connection fails' do
      allow(PG).to receive(:connect).and_raise(PG::Error.new('Connection failed'))

      expect { subject.connect(**connection_params) }.to raise_error(PG::Error, 'Connection failed')
    end
  end

  describe '#disconnect' do
    it 'closes the connection and sets pg_connection to nil' do
      allow(PG).to receive(:connect).and_return(pg_connection)
      allow(pg_connection).to receive(:close)

      subject.connect(**connection_params)
      subject.disconnect

      expect(subject.instance_variable_get(:@pg_connection)).to be_nil
    end
  end

  describe '#execute' do
    let(:query) { 'SELECT * FROM users WHERE id = $1' }
    let(:params) { [1] }

    before do
      allow(PG).to receive(:connect).and_return(pg_connection)
      allow(pg_connection).to receive(:finished?).and_return(false)
    end

    it 'executes the query with the provided parameters' do
      allow(pg_connection).to receive(:exec_params).with(query, params).and_return('result')

      subject.connect(**connection_params)
      sut = subject.execute(query, params)

      expect(sut).to eq('result')
      expect(pg_connection).to have_received(:exec_params).with(query, params)
    end

    it 'connects to the database if not already connected' do
      allow(pg_connection).to receive(:exec_params).with(query, params).and_return('result')

      subject.instance_variable_set(:@pg_connection, nil)
      expect(subject).to receive(:connect).with(connection_params).and_call_original

      sut = subject.execute(query, params)
      expect(sut).to eq('result')
      expect(subject.instance_variable_get(:@pg_connection)).not_to be_nil
      expect(pg_connection).to have_received(:exec_params).with(query, params)
    end
  end

  describe '#connected?' do
    before do
      allow(PG).to receive(:connect).and_return(pg_connection)
    end

    it 'returns true if connected to the database' do
      allow(pg_connection).to receive(:finished?).and_return(false)

      subject.connect(**connection_params)
      expect(subject.connected?).to be true
    end

    it 'returns false if not connected to the database' do
      allow(pg_connection).to receive(:finished?).and_return(true)

      subject.connect(**connection_params)
      expect(subject.connected?).to be false
    end
  end
end
