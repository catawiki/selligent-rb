# frozen_string_literal: true

module Selligent
  class Client
    # Implements the journeys base endpoint
    #
    # /organizations/:organization/journeys
    module Journeys
      # Get an overview of all journeys set up in the organization
      def journeys
        get "#{base_url}/journeys"
      end
    end
  end
end
