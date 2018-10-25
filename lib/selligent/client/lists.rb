# frozen_string_literal: true

module Selligent
  class Client
    # Implements the list endpoints
    #
    # /organizations/:organization/lists/*
    module Lists
      # Returns an overview of all of the lists in this organization
      #
      # @param options [Hash] Options for filtering, searching, etc.
      # @option options [String] :filter Filter list by type
      # @option options [String] :search Search a list by name, description or tags
      # @option options [Integer] :skip Specify index to start picking list items from
      # @option options [Integer] :take Specify count for the number of items to be taken
      def lists(options = {})
        get "#{base_url}/lists", options
      end

      def create_list(list_name, options)
      end

      def delete_list(list_name, options)
      end

      def list(list_name)
      end

      def update_list(list_name)
      end

      def list_fields(list_name)
      end

      def create_list_fields(list_name)
      end

      def delete_list_field(list_name, field_name)
      end

      def update_list_field(list_name, fieldname)
      end

      def list_records(list_name)
      end

      def delete_list_record(list_name, record_id)
      end

      def list_relations(list_name)
      end

      def create_list_relation(list_name)
      end

      def delete_list_relation(list_name, scope)
      end

      def update_list_relation(list_name, scope)
      end

      def list_segments(list_name)
      end

      def list_segment(list_name, segment_name)
      end
    end
  end
end
