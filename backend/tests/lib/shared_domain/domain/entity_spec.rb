# frozen_string_literal: true

require_relative '../../../../src/lib/shared_domain/domain/entity'

RSpec.describe SharedDomain::Domain::Entity do
  it 'uses the provided id if given' do
    sut = described_class.new(id: '12345')

    expect(sut.id).to eq('12345')
  end
end
