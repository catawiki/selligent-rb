# frozen_string_literal: true

module Selligent
  class Client
    # Implements the CIM endpoints
    #
    # /organizations/:organization/cim/*
    module CIM
      # The request body for collect/optout/remove
      # should have the following structure:
      #
      # {
      #   "filters": [
      #     {
      #       "field": "string",
      #       "value": "string"
      #     }
      #   ]
      # }
      #
      # @param api_name [String] The api name
      # @param filters [Array<Hash>] The filters to apply
      # @option filters [String] :field The field to filter on
      # @option filters [String] :value The value to filter by
      # You can choose up to four fields to identify the subject
      # for the request.

      # Collects, for the selected lists, all data available
      # in the Engage environment, including Site and Recommendations.
      # Once the data has been gathered, it can be downloaded and
      # made available in a JSON file. The dashboard indicates when
      # the file is available for download
      def cim_collect(api_name, data)
        post("#{base_url}/cim/#{api_name}/collect", data)
      end

      # Unsubscribes a subject from the selected lists
      def cim_optout(api_name, data)
        post("#{base_url}/cim/#{api_name}/optout", data)
      end

      # Permanently removes the data after 30 days.
      # No restore of the data is possible.
      def cim_remove(api_name, data)
        post("#{base_url}/cim/#{api_name}/remove", data)
      end

      # Cancel a CIM request
      def cim_cancel(request_id)
        delete("#{base_url}/cim/request/#{request_id}")
      end

      # Get the state of a CIM request
      def cim_state(request_id)
        get("#{base_url}/cim/request/#{request_id}/state")
      end

      # Get the result of a CIM collect request
      def cim_result(request_id)
        get("#{base_url}/cim/request/#{request_id}")
      end
    end
  end
end
