# frozen_string_literal: true

require 'swagger/blocks'

module App
  module Docs
    module SwaggerDocs
      include Swagger::Blocks

      module_function

      def generate_docs
        swagger_root = Swagger::Blocks.build_root_json([self])
        JSON.pretty_generate(swagger_root)
      end

      swagger_component do
        schema :RoomInput do
          key :type, :object
          key :required, [:name, :capacity, :location]
          property :name do
            key :type, :string
            key :description, 'Name of the room'
            key :example, 'Conference Room A'
          end
          property :capacity do
            key :type, :integer
            key :description, 'Maximum capacity of the room'
            key :example, 10
          end
          property :location do
            key :type, :string
            key :description, 'Physical location of the room'
            key :example, 'Floor 3, Building B'
          end
        end

        schema :RoomOutput do
          key :type, :object
          property :id do
            key :type, :string
            key :description, 'Unique identifier of the room'
            key :example, '550e8400-e29b-41d4-a716-446655440000'
          end
          property :name do
            key :type, :string
            key :description, 'Name of the room'
          end
          property :capacity do
            key :type, :integer
            key :description, 'Maximum capacity of the room'
          end
          property :location do
            key :type, :string
            key :description, 'Physical location of the room'
          end
        end
      end

      swagger_root do
        key :openapi, '3.0.0'
        info do
          key :version, '1.0.0'
          key :title, 'Meeting Room Reservation API'
          key :description, 'API for managing meeting room reservations'
          contact do
            key :name, 'Lucas Alves da Silva'
            key :email, 'web4dev.lucas@outlook.com'
          end
          license do
            key :name, 'MIT'
          end
        end

        server do
          key :url, 'http://localhost:9292'
        end
      end

      swagger_path '/api/v1/rooms' do
        operation :post do
          key :summary, 'Create a new meeting room'
          key :description, 'Creates a new meeting room with the specified attributes'
          key :operationId, 'createRoom'
          key :tags, ['Rooms']

          request_body do
            key :description, 'Room attributes'
            key :required, true
            content 'application/json' do
              schema do
                key :'$ref', '#/components/schemas/RoomInput'
              end
            end
          end

          response 201 do
            key :description, 'Room created successfully'
            content 'application/json' do
              schema do
                key :'$ref', '#/components/schemas/RoomOutput'
              end
            end
          end

          response 422 do
            key :description, 'Validation errors'
            content 'application/json' do
              schema do
                key :type, :object
                property :errors do
                  key :type, :array
                  items do
                    key :type, :string
                  end
                end
              end
            end
          end

          response 500 do
            key :description, 'Internal server error'
            content 'application/json' do
              schema do
                key :type, :object
                property :error do
                  key :type, :string
                end
              end
            end
          end
        end
      end
    end
  end
end
