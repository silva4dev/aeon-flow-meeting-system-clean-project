# frozen_string_literal: true

require_relative '../../../../../src/lib/rooms/infrastructure/repositories/sqlite_room_repository'
require_relative '../../../../../src/lib/shared_domain/infrastructure/rom'
require_relative '../../../../../src/lib/rooms/domain/entities/room_entity'

RSpec.describe Rooms::Infrastructure::Repositories::SqliteRoomRepository do
  let(:rom) { SharedDomain::Infrastructure::Rom.new }
  let(:repository) { described_class.new }

  before do
    rom.db[:rooms].truncate
    allow(Rooms::AppContainer).to receive(:resolve).with('infrastructure.rom').and_return(rom)
  end

  after do
    rom.container.disconnect
  end

  describe '#add' do
    it 'persists a new room' do
      room = Rooms::Domain::Entities::Room.new(
        name: 'Conference',
        capacity: 10,
        location: 'Room 4'
      )

      expect {
        repository.add(room)
      }.to change { rom[:rooms].count }.by(1)
    end
  end
end
