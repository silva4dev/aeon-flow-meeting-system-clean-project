# frozen_string_literal: true

require_relative '../../../src/bounded_contexts/shared_domain/container'

RSpec.describe SharedDomain::Container do
  subject(:sut) { SharedDomain::Container }

  it 'extends Dry::Container module' do
    expect(sut).to be_a(Dry::Container::Mixin)
  end

  it 'can register and resolve dependencies' do
    sut.register(:example_service) { "Example Service" }

    expect(sut.resolve(:example_service)).to eq("Example Service")
  end

  it 'raises an error when resolving an unregistered dependency' do
    expect { sut.resolve(:non_existent_service) }.to raise_error(Dry::Container::KeyError)
  end
end
