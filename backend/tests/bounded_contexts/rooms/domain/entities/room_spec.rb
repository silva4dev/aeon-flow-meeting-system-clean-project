# frozen_string_literal: true

require_relative '../../../../../src/bounded_contexts/rooms/domain/entities/room'

RSpec.describe Room, type: :entity do
  describe '#initialize' do
    it 'creates a new room' do
      sut = Room.new(
        name: 'Conference Room',
        capacity: 10,
        location: 'Room 4'
      )

      expect(sut.id).not_to be_nil
      expect(sut.capacity).to eq(10)
      expect(sut.name).to eq('Conference Room')
      expect(sut.location).to eq('Room 4')
    end
  end
end
