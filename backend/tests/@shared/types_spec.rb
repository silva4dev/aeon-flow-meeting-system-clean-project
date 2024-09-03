# frozen_string_literal: true

require_relative '../../src/@shared/types'

RSpec.describe Types do
  subject(:sut) { Types }

  it 'includes Dry::Types module' do
    expect(sut).to respond_to(:Constructor)
  end
end
