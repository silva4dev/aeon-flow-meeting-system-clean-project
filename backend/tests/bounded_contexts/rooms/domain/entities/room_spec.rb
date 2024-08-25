# frozen_string_literal: true

require_relative '../../../../../src/bounded_contexts/rooms/domain/entities/room'

RSpec.describe Room, type: :entity do
  describe '#initialize' do
    context 'with valid attributes' do
      it 'creates a new room' do
        room = Room.new(name: 'Conference', capacity: 10, location: 'Room 4')

        expect(room.name).to eq('Conference')
        expect(room.capacity).to eq(10)
        expect(room.location).to eq('Room 4')
      end
    end

    context 'with invalid attributes' do
      it 'raises an error when name is empty' do
        expect {
          Room.new(name: '', capacity: 10, location: 'Room 4')
        }.to raise_error(ArgumentError, /name/)
      end

      it 'raises an error when capacity is negative' do
        expect {
          Room.new(name: 'Conference Room', capacity: -1, location: 'Room 4')
        }.to raise_error(ArgumentError, /capacity/)
      end

      it 'raises an error when location is empty' do
        expect {
          Room.new(name: 'Conference Room', capacity: 10, location: '')
        }.to raise_error(ArgumentError, /location/)
      end
    end
  end
end
