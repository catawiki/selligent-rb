# frozen_string_literal: true

module Selligent
  class Client
    # Implements the list endpoints
    #
    # /organizations/:organization/lists/*
    module Lists
      def lists(options)
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
