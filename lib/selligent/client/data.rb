# frozen_string_literal: true

module Selligent
  class Client
    # Implements the data endpoints
    #
    # /organizations/:organization/lists/data/*
    module Data
      # Deletes data from the list with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param data [Array<Array>] The data
      # @param params [Hash] Additional options
      # @option params [String] :keyFields Comma-separated list of the key fields to delete records
      # @option params [String] :fields Comma-separated list of the fields in data records
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      # @option params [String] :errorHandling Error handling options
      def delete_data(api_name, data, params = {})
        delete("#{base_url}/lists/#{api_name}/data", params) do |req|
          req.body = data.to_json
        end
      end

      # Loads data into the list with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param data [Array<Array>] The data
      # @param params [Hash] Additional options
      # @option params [String] :keyFields Comma-separated list of the key fields to delete records
      # @option params [String] :fields Comma-separated list of the fields in data records
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      # @option params [String] :deduplication De-duplication option during an import data
      # @option params [String] :data_import_option Data import option during an import data
      # @option params [String] :create_segment_name Segment name at the time of creation
      # @option params [String] :create_segment_api_name Segment api name at the time of creation
      # @option params [String] :errorHandling Error handling options
      def load_data(api_name, data, params = {})
        post("#{base_url}/lists/#{api_name}/data/load", data) do |req|
          req.params.merge!(params)
          logger.notify 'Selligent data load',
                        "loading #{api_name}",
                        request: req.inspect
        end
      end

      # Method to search for data records in a specific table
      #
      # The request has the following shape:
      #
      # {
      #   "fields": [
      #     "FIELD1",
      #     "FIELD2"
      #   ],
      #   "filters": [
      #     {
      #       "field_name": "FIELD1",
      #       "operator": "EqualTo",
      #       "field_value": "VALUE"
      #     }
      #   ],
      #   "skip": 20,
      #   "take": 20,
      #   "order_by": "FIELD2",
      #   "order_by_direction": "ASC"
      # }
      #
      # @param api_name [String] The api name
      # @param request [Hash] Details on the data that should be searched
      # @param params [Hash] Additional options
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      def search_data(api_name, request, params = {})
        post("#{base_url}/lists/#{api_name}/data/search", request) do |req|
          req.params.merge!(params)
        end
      end

      # Deletes data via json from the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param data [Array<Array>] The data
      # @param params [Hash] Additional options
      # @option params [String] :keyFields Comma-separated list of the key fields to delete records
      # @option params [String] :fields Comma-separated list of the fields in data records
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      # @option params [String] :errorHandling Error handling options
      def delete_data_from_segment(api_name, segment_api_name, data, params = {})
        delete("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data", params) do |req|
          req.body = data.to_json
        end
      end

      # Loads data into the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param data [Array<Array>] The data
      # @param params [Hash] Additional options
      # @option params [String] :fields Comma-separated list of the fields in data records
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      # @option params [String] :deduplication De-duplication option during an import data
      # @option params [String] :errorHandling Error handling options
      def load_data_into_segment(api_name, segment_api_name, data, params = {})
        post("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/load", data) do |req|
          req.params.merge!(params)
        end
      end

      # Method to search for data records within a segment of specific table
      #
      # The request has the following shape:
      #
      # {
      #   "fields": [
      #     "FIELD1",
      #     "FIELD2"
      #   ],
      #   "filters": [
      #     {
      #       "field_name": "FIELD1",
      #       "operator": "EqualTo",
      #       "field_value": "VALUE"
      #     }
      #   ],
      #   "skip": 20,
      #   "take": 20,
      #   "order_by": "FIELD2",
      #   "order_by_direction": "ASC"
      # }
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param request [Hash] details on the data that should be searched
      # @param params [Hash] Additional options
      # @option params [String] :mode Data transfer mode (Sync or Stream)
      def search_data_within_segment(api_name, segment_api_name, request, params = {})
        post(
          "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/search",
          request
        ) do |req|
          req.params.merge!(params)
        end
      end
    end
  end
end
