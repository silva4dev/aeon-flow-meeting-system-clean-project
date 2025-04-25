# frozen_string_literal: true

require_relative '../../../../src/lib/shared_domain/web/action'

RSpec.describe SharedDomain::Web::Action do
  let(:action_class) do
    Class.new(described_class) do
      def call(params = {})
        { result: "called with #{params}" }
      end
    end
  end

  let(:sut) { action_class.new }

  describe '#call' do
    context 'when not implemented' do
      it 'raises NotImplementedError' do
        expect { described_class.new.call }.to raise_error(NotImplementedError)
      end
    end

    context 'when implemented in subclass' do
      let(:params) { { key: 'value' } }

      it 'accepts parameters' do
        expect(sut.call(params)).to eq({ result: "called with #{params}" })
      end

      it 'works without parameters' do
        expect(sut.call).to eq({ result: 'called with {}' })
      end
    end
  end

  describe 'as an abstract base class' do
    it 'cannot be instantiated directly with meaningful behavior' do
      expect(described_class.new).to be_a(SharedDomain::Web::Action)
      expect { described_class.new.call }.to raise_error(NotImplementedError)
    end
  end
end
