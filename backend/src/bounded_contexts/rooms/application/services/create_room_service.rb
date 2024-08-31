# frozen_string_literal: true

require_relative '../../../../shared_kernel/service'

class CreateRoomService < Service
  def call
    if true
      Success({ message: 'Room created successfully' })
    else
      Failure({ message: 'Failed to create room' })
    end
  end
end
