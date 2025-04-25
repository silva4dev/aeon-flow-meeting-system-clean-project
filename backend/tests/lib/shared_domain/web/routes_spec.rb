# frozen_string_literal: true

require_relative '../../../../src/lib/shared_domain/web/routes'

RSpec.describe SharedDomain::Web::Routes do
  let(:routes_module) { described_class }
  let(:test_app) { double('App') }

  describe '#register' do
    context 'when included in a class without implementation' do
      let(:sut) { Class.new { include SharedDomain::Web::Routes } }

      it 'raises NotImplementedError' do
        expect { sut.new.register(test_app) }.to raise_error(NotImplementedError)
      end
    end

    context 'when implemented in including class' do
      let(:implemented_class) do
        Class.new do
          include SharedDomain::Web::Routes

          def register(app)
            app.post('/test', to: 'test#create')
            { status: 'registered', app: app }
          end
        end
      end

      it 'properly implements the interface' do
        instance = implemented_class.new
        expect(test_app).to receive(:post).with('/test', to: 'test#create')

        sut = instance.register(test_app)

        expect(sut).to eq({ status: 'registered', app: test_app })
      end
    end
  end

  describe 'as a module' do
    it 'cannot be instantiated directly' do
      expect { routes_module.new }.to raise_error(NoMethodError)
    end

    it 'must be included in a class' do
      expect(routes_module).to be_a(Module)
      expect { routes_module.register(test_app) }.to raise_error(NoMethodError)
    end
  end
end
