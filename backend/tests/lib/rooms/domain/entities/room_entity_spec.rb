# frozen_string_literal: true

require_relative '../../../../../src/lib/rooms/domain/entities/room_entity'
require_relative '../../../../../src/lib/rooms/domain/errors/room_validation_error'

RSpec.describe Rooms::Domain::Entities::Room, type: :entity do
  describe '#initialize' do
    context 'with valid attributes' do
      it 'creates a new room' do
        sut = described_class.new(
          name: 'Conference',
          capacity: 10,
          location: 'Room 4'
        )

        expect(sut.name).to eq('Conference')
        expect(sut.capacity).to eq(10)
        expect(sut.location).to eq('Room 4')
      end
    end

    context 'with invalid attributes' do
      it 'raises an error when name is empty' do
        expect {
          described_class.new(name: '', capacity: 10, location: 'Room 4')
        }.to raise_error(Rooms::Domain::Errors::RoomValidationError, /name/)
      end

      it 'raises an error when capacity is negative' do
        expect {
          described_class.new(name: 'Conference Room', capacity: -1, location: 'Room 4')
        }.to raise_error(Rooms::Domain::Errors::RoomValidationError, /capacity/)
      end

      it 'raises an error when location is empty' do
        expect {
          described_class.new(name: 'Conference Room', capacity: 10, location: '')
        }.to raise_error(Rooms::Domain::Errors::RoomValidationError, /location/)
      end
    end
  end
end
