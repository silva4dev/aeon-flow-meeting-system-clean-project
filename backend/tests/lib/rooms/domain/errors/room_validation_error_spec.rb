# frozen_string_literal: true

require_relative '../../../../../src/lib/rooms/domain/errors/room_validation_error'
require_relative '../../../../../src/lib/shared_domain/domain/notification'

RSpec.describe Rooms::Domain::Errors::RoomValidationError do
  subject(:error) { described_class.new(notification) }

  let(:errors) { { name: ["can't be blank"], capacity: ['must be greater than 0'] } }
  let(:notification) do
    SharedDomain::Domain::Notification.new.tap do |n|
      errors.each { |field, messages| messages.each { |msg| n.add_error(field, msg) } }
    end
  end

  describe '#initialize' do
    it 'sets the notification attribute' do
      expect(error.notification).to eq(notification)
    end

    it 'composes message from notification errors' do
      error_messages = errors.flat_map { |field, msgs| msgs.map { |msg| "#{field}: #{msg}" } }
      expect(error.message).to eq("Room validation failed: #{error_messages.join(', ')}")
    end

    context 'when notification has no errors' do
      let(:errors) { {} }

      it 'sets default message structure' do
        expect(error.message).to eq('Room validation failed: ')
      end
    end
  end
end
