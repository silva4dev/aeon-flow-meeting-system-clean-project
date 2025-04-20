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
      end
    end
  end
end

