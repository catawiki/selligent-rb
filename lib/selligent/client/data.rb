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
      # @param keyFields [String] Comma-separated list of the key fields to delete records
      # @option options [String] :fields Comma-separated list of the fields in data records
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      # @option options [String] :errorHandling Error handling options
      def delete_data(api_name, options = {})
        delete "#{base_url}/lists/#{api_name}/data", options
      end

      # Loads data into the list with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param keyFields [String] Comma-separated list of the key fields to create/update records
      # @option options [String] :fields Comma-separated list of the fields in data records
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      # @option options [String] :deduplication De-duplication option during an import data
      # @option options [String] :data_import_option Data import option during an import data
      # @option options [String] :create_segment_name Segment name at the time of creation
      # @option options [String] :create_segment_api_name Segment api name at the time of creation
      # @option options [String] :errorHandling Error handling options
      def load_data(api_name, options = {})
        post "#{base_url}/lists/#{api_name}/data/load", options
      end

      # Method to search for data records in a specific table
      #
      # @param api_name [String] The api name
      # @param request  [String] Details on the data that should be searched
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      def search_data(api_name, options = {})
        post "#{base_url}/lists/#{api_name}/data/search", options
      end

      # Deletes data via json from the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param keyFields [String] Comma-separated list of the key fields to delete records
      # @option options [String] :fields Comma-separated list of the fields in data records
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      # @option options [String] :errorHandling Error handling options
      def delete_data_from_segment(api_name, segment_api_name, options = {})
        delete "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data", options
      end

      # Loads data into the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      #
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param keyFields [String] Comma-separated list of the key fields to create/update records
      # @option options [String] :fields Comma-separated list of the fields in data records
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      # @option options [String] :deduplication De-duplication option during an import data
      # @option options [String] :errorHandling Error handling options
      def load_data_into_segment(api_name, segment_api_name, options = {})
        post "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/load", options
      end

      # Method to search for data records within a segment of specific table
      #
      # @param api_name [String] The api name
      # @param segment_api_name [String] API name of the segment
      # @param request [String] details on the data that should be searched
      # @option options [String] :mode Data transfer mode (Sync or Stream)
      def search_data_within_segment(api_name, segment_api_name, options = {})
        post "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/search", options
      end
    end
  end
end
