# frozen_string_literal: true

module Selligent
  class Client
    # Implements the custom journeys endpoints
    #
    # /organizations/:organization/journeys/custom/:api_name/entrypoints/:entrypoint_name/trigger
    module CustomJourney
      # Trigger execution of a custom journey
      #
      # The input has the following shape:
      # Please note that parameter_values will differ per journey
      #
      # {
      #   "user_id": 0,
      #   "parameter_values": {
      #      "catawiki_id": Interger,
      #      "bid_timestamp": String
      #   }
      # }
      #
      # @param user_id [Integer] Internal Selligent user ID. Sent as 0 by default.
      # @param parameter_values [Hash] The input data in the format provided by the CRM team.
      def trigger_custom_journey(api_name, entrypoint_name, input)
        post "#{base_url}/journeys/custom/#{api_name}/entrypoints/#{entrypoint_name}/trigger", input
      end
    end
  end
end
