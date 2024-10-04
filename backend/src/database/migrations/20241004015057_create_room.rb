# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:rooms) do
      String :id, primary_key: true
      String :name
      Integer :capacity
      String :location
    end
  end

  down do
    drop_table(:rooms)
  end
end
