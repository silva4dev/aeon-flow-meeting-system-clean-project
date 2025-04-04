# frozen_string_literal: true

require_relative '../../../../../src/lib/rooms/domain/errors/room_validation_error'

RSpec.describe Rooms::Domain::Errors::RoomValidationError do
  let(:errors) { { name: ["can't be blank"], capacity: ["must be greater than 0"] } }
  let(:error_message) { "Room validation failed: #{errors}" }
  subject(:sut) { described_class.new(errors) }

  describe '#initialize' do
    it 'sets the correct error message' do
      expect(sut.message).to eq(error_message)
    end
  end
end
