# frozen_string_literal: true

require_relative '../../../../src/lib/shared_domain/application/use_case'

RSpec.describe SharedDomain::Application::UseCase do
  before(:all) do
    class UseCaseFake < SharedDomain::Application::UseCase
      def call(success: true)
        success ? Dry::Monads::Success('Operation was successful') : Dry::Monads::Failure('Operation failed')
      end
    end
  end

  describe '#call' do
    it 'raises NotImplementedError for the base Service class' do
      sut = UseCaseFake.new
      allow(sut).to receive(:call).and_raise(NotImplementedError)
      expect { sut.call }.to raise_error(NotImplementedError)
    end

    context 'when the operation is successful' do
      it 'returns a Success result' do
        sut = UseCaseFake.new.call(success: true)
        expect(sut).to be_a(Dry::Monads::Result::Success)
        expect(sut.value!).to eq('Operation was successful')
      end
    end

    context 'when the operation fails' do
      it 'returns a Failure result' do
        sut = UseCaseFake.new.call(success: false)
        expect(sut).to be_a(Dry::Monads::Result::Failure)
        expect(sut.failure).to eq('Operation failed')
      end
    end
  end
end
