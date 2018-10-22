# frozen_string_literal: true

module Selligent
  class Client
    # Implementation of campaign endpoints
    module Campaigns
      # Trigger a campaign asynchronously
      #
      # @param campaign_id [Integer, String] The campaign's id
      # @param options [Hash] Additionally needed information
      # @option options [Integer, String] :ActionList the ID of the action list
      # @option options [Hash] :ActionListRecord the data that needs to be put in the record
      # @option options [String] :Gate The name of the gate used to access the campaign
      # @option options [String] :GateInput Optional input parameters passed on to the gate
      # @option options [Integer, String] The ID of the user for who the campaign is triggered
      # @option options [Integer, String] The ID of the user list to which the user belongs
      def trigger_campaign(campaign_id, options = {})
        post "/restapi/api/async/campaigns/#{campaign_id}/trigger", options
      end

      # Trigger a campaign by Gate and optionally send parameters
      #
      # @param options [Hash] Additionally needed information
      # @option options [String] :Gate The name of the gate used to access the campaign
      # @option options [Symbol] Send as :async or :sync (:async by default)
      # @option options [String] :GateInput Optional input parameters passed on to the gate
      def trigger_campaign_by_json(options = {})
        type = options.fetch(:type, :async)
        post "/restapi/api/#{type}/campaigns/triggerbyjson", options
      end
    end
  end
end
