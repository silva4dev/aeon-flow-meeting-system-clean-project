# frozen_string_literal: true

require_relative '../../../src/shared_domain/domain/entity'

RSpec.describe SharedDomain::Domain::Entity do
  it 'generates a UUID by default if id is not provided' do
    sut = SharedDomain::Domain::Entity.new

    expect(sut.id).not_to be_nil
  end

  it 'uses the provided id if given' do
    sut = SharedDomain::Domain::Entity.new(id: '12345')

    expect(sut.id).to eq('12345')
  end
end
