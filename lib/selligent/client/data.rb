# frozen_string_literal: true

module Selligent
  class Client
    # Implements the data endpoints
    #
    # /organizations/:organization/lists/data/*
    module Data
      # Deletes data from the list with the given api-name in the given organization
      def delete_data(api_name)
        delete "#{base_url}/lists/#{api_name}/data"
      end

      # Loads data into the list with the given api-name in the given organization
      def load_data(api_name)
        post "#{base_url}/lists/#{api_name}/data/load"
      end

      # Method to search for data records in a specific table
      def search_data(api_name)
        post "#{base_url}/lists/#{api_name}/data/search"
      end

      # Deletes data via json from the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      def delete_data_from_segment(api_name, segment_api_name)
        delete "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data"
      end

      # Loads data into the segment with the given segment-api-name in the list
      # with the given api-name in the given organization
      def load_data_into_segment(api_name, segment_api_name)
        post "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/load"
      end

      # Method to search for data records within a segment of specific table
      def search_data_within_segment(api_name, segment_api_name)
        post "#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/search"
      end
    end
  end
end
