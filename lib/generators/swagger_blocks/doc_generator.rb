# frozen_string_literal: true

module SwaggerBlocks
  module Generators
    class DocGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      argument :model, type: :string
      class_option :fast_json_api, type: :boolean, default: false, desc: "Creates a documentation based on the JSON API specification"

      def generate_documentation
        begin
          Object.const_get(model.camelcase).is_a?(Class)
          case
          when options.fast_json_api?
            Object.const_get("#{model.camelcase}Serializer").is_a?(Class)
            generate_model_doc_jsonapi_template
            generate_controller_doc_template
          else
            generate_model_doc_template
            generate_controller_doc_template
          end
        rescue Exception => e
          p e.message
          exit!
        end
      end

      private
        def generate_model_doc_template
          template "model_doc_template.template", "app/controllers/docs/#{model.underscore}.rb"
        end

        def generate_controller_doc_template
          template "controller_doc_template.template", "app/controllers/docs/#{model.underscore.pluralize}_controller.rb"
        end

        def generate_model_doc_jsonapi_template
          template "model_doc_jsonapi_template.template", "app/controllers/docs/#{model.underscore}.rb"
        end
    end
  end
end
