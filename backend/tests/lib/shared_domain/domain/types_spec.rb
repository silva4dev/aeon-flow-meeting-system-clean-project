# frozen_string_literal: true

require_relative '../../../../src/lib/shared_domain/domain/types'

RSpec.describe SharedDomain::Domain::Types do
  subject(:sut) { SharedDomain::Domain::Types }

  it 'includes Dry::Types module' do
    expect(sut).to respond_to(:Constructor)
  end
end
