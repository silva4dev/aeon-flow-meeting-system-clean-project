# frozen_string_literal: true

require_relative '../../../../../src/lib/rooms/app_container'
require_relative '../../../../../src/lib/rooms/application/usecases/create_room_usecase'
require_relative '../../../../../src/lib/rooms/domain/entities/room_entity'
require_relative '../../../../../src/lib/rooms/application/repositories/room_repository'

RSpec.describe Rooms::Application::UseCases::CreateRoomUseCase do
  let(:room_repository) { instance_double(Rooms::Application::Repositories::RoomRepository) }
  let(:use_case) { described_class.new }

  before do
    allow(Rooms::AppContainer).to receive(:resolve).with('rooms.room_repository').and_return(room_repository)
  end

  describe '#call' do
    context 'with valid input data' do
      before do
        allow(room_repository).to receive(:add).with(instance_of(Rooms::Domain::Entities::Room)).and_return(nil)
      end

      it 'creates a new room successfully' do
        result = use_case.call({
           name: 'Conference',
           capacity: 10,
           location: 'Room 4'
        })

        expect(result).to be_success
        expect(result.value!.name).to eq('Conference')
        expect(result.value!.capacity).to eq(10)
        expect(result.value!.location).to eq('Room 4')
      end
    end
  end
end
