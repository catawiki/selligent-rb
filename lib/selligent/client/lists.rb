# frozen_string_literal: true

module Selligent
  class Client
    # Implements the list endpoints
    #
    # In this module, `list_name` is the list name as it appears in the API urls.
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

      # Create a new list
      #
      # The model has the following shape:
      #
      # {
      #   "api_name": "list_name_in_api",
      #   "name": "list_name",
      #   "type": "Userlist",
      #   "description": "description",
      #   "tags": [
      #     "tag1",
      #     "tag2"
      #   ]
      # }
      #
      # @param model [Hash] The model containing the data that should be sent
      def create_list(model)
        post "#{base_url}/lists", model
      end

      # Delete a list
      #
      # @param list_name [String] The list API name
      # @param options [Hash] Additional options
      # @option options [Boolean] :dropTable delete the associated table
      def delete_list(list_name, options = {})
        delete "#{base_url}/lists/#{list_name}", options
      end

      # Get details for the list with the given name
      #
      # @param list_name [String] The list API name
      def list(list_name)
        get "#{base_url}/lists/#{list_name}"
      end

      # Update a list
      #
      # The model has the following shape:
      #
      # {
      #   "api_name": "list_name_in_api",
      #   "name": "list_name",
      #   "description": "description",
      #   "tags": [
      #     "tag1",
      #     "tag2"
      #   ],
      #   "email_quality_configuration": {
      #     "type": "Normal",
      #     "bounce_scope": "MASTER",
      #     "actions": [
      #       {
      #         "name": "OPTOUT",
      #         "value": "10"
      #       }
      #     ],
      #     "bouncestoredprocedures": [
      #       "ST_Bounce_Sp1",
      #       "ST_Bounce_Sp2"
      #     ]
      #   }
      # }
      #
      # @param list_name [String] The list API name
      # @param model [Hash] The model containing the data that should be sent
      def update_list(list_name, model)
        put "#{base_url}/lists/#{list_name}", model
      end

      # Get list fields for the given list
      #
      # @param list_name [String] The list API name
      def fields(list_name)
        get "#{base_url}/lists/#{list_name}/fields"
      end

      # Create list fields
      #
      # The model has the following shape:
      #
      # {
      #   "fields": [
      #     {
      #       "name": "string",
      #       "data_type": "Boolean",
      #       "length": 0,
      #       "description": "string",
      #       "allow_null": true
      #     }
      #   ]
      # }
      #
      # @param list_name [String] The list API name
      # @param model [Hash] The model containing the data that should be sent
      def create_fields(list_name, model)
        post "#{base_url}/lists/#{list_name}/fields", model
      end

      # Delete a list field
      #
      # @param list_name [String] The list API name
      # @param field_name [String] The field name
      def delete_field(list_name, field_name)
        delete "#{base_url}/lists/#{list_name}/fields/#{field_name}"
      end

      # Update a list field
      #
      # The model has the following shape:
      #
      # {
      #   "field_name": "FIELD",
      #   "field_description": "This is FIELD."
      # }
      #
      # @param list_name [String] The list API name
      # @param field_name [String] The field name
      # @param model [Hash] The model containing the data that should be sent
      def update_field(list_name, field_name, model)
        put "#{base_url}/lists/#{list_name}/fields/#{field_name}", model
      end

      # Get the number of records for the given list
      #
      # @param list_name [String] The list API name
      def records_count(list_name)
        get "#{base_url}/lists/#{list_name}/records"
      end

      # Delete a single record by id
      #
      # @param list_name [String] The list API name
      # @param record_id [Integer] The record id
      def delete_record(list_name, record_id)
        delete "#{base_url}/lists/#{list_name}/records/#{record_id}"
      end

      # Get all relations associated with a list
      #
      # @param list_name [String] The list API name
      def relations(list_name)
        get "#{base_url}/lists/#{list_name}/relations"
      end

      # Create a relation between two lists
      #
      # The model has the following shape:
      #
      # {
      #   "relations": [
      #     {
      #       "scope": "string",
      #       "type": "OneToOne",
      #       "masterlist_field_name": "string",
      #       "slavelist_api_name": "string",
      #       "slavelist_field_name": "string",
      #       "constraints": [
      #         {
      #           "list1": "string",
      #           "field1": "string",
      #           "operator": "Unknown",
      #           "list2": "string",
      #           "field2": "string",
      #           "value": "string"
      #         }
      #       ]
      #     }
      #   ]
      # }
      #
      # @param list_name [String] The list API name
      # @param model [Hash] The model containing the data that should be sent
      def create_relation(list_name, model)
        post "#{base_url}/lists/#{list_name}/relations", model
      end

      # Delete a relation between two lists
      #
      # @param list_name [String] The list API name
      # @param scope [String] The scope name of the relation
      def delete_relation(list_name, scope)
        delete "#{base_url}/lists/#{list_name}/relations/#{scope}"
      end

      # Get relation details based based on the list name and the relation scope name
      #
      # @param list_name [String] The list API name
      # @param scope [String] The scope name of the relation
      def relation(list_name, scope)
        get "#{base_url}/lists/#{list_name}/relations/#{scope}"
      end

      # Update an existing relation
      #
      # The model has the following shape:
      #
      # {
      #   "scope_name": "RELATION",
      #   "relation_type": "OneToMany",
      #   "master_list_field_name": "MASTERLISTFIELD",
      #   "slave_list_api_name": "SLAVELIST",
      #   "slave_list_field_name": "SLAVELISTFIELD",
      #   "constraints": [
      #     {
      #       "source_list": "MASTER",
      #       "source_field": "master_field",
      #       "operator": "EqualTo",
      #       "destination_list": "SLAVE",
      #       "destination_field": "slave_field",
      #       "field_value": ""
      #     }
      #   ]
      # }
      #
      # @param list_name [String] The list API name
      # @param scope [String] The scope name of the relation
      # @param model [Hash] The model containing the data that should be sent
      def update_relation(list_name, scope, model)
        put "#{base_url}/lists/#{list_name}/relations/#{scope}", model
      end

      # Get an overview of the segments defined on the given list
      #
      # @param list_name [String] The list API name
      # @option options [String] :filter Filter segment by type
      # @option options [String] :search Search a segment by name, description or tags
      # @option options [Integer] :skip Specify index to start picking segment items from
      # @option options [Integer] :take Specify count for the number of segments to be taken
      def segments(list_name, options = {})
        get "#{base_url}/lists/#{list_name}/segments", options
      end

      # Get segment details based on list API name and segment API name
      #
      # @param list_name [String] The list API name
      # @param segment_name [String] The name of the segment
      def segment(list_name, segment_name)
        get "#{base_url}/lists/#{list_name}/segments/#{segment_name}"
      end
    end
  end
end
