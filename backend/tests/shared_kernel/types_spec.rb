# frozen_string_literal: true

require_relative '../../src/shared_kernel/types'

RSpec.describe Types do
  it 'includes Dry::Types module' do
    expect(Types).to respond_to(:Constructor)
  end
end
