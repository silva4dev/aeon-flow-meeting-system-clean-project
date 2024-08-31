# frozen_string_literal: true

require_relative '../../src/@shared/entity'

RSpec.describe Entity do
  it 'generates a UUID by default if id is not provided' do
    sut = Entity.new

    expect(sut.id).not_to be_nil
  end

  it 'uses the provided id if given' do
    sut = Entity.new(id: '12345')

    expect(sut.id).to eq('12345')
  end
end
