# frozen_string_literal: true

module Selligent
  class Client
    # Implements the Cumulio endpoints
    #
    # /reporting/cumulio/:organization/{datasets, query}
    module Cumulio
      # Get datasets
      def cumulio_datasets
        get "/reporting/cumulio/#{config.organization}/datasets"
      end

      # Run a cumulio query
      #
      # The model has the following shape:
      #
      # {
      #   "id": "string",
      #   "columns": [
      #     {
      #       "column_id": "string",
      #       "aggregation": "none",
      #       "level": "none"
      #     }
      #   ],
      #   "filters": [
      #     {
      #       "column_id": "string",
      #       "expression": "unknown",
      #       "value": [
      #         "string"
      #       ]
      #     }
      #   ],
      #   "user": {
      #     "id": "string",
      #     "name": "string",
      #     "email": "string",
      #     "authorization_id": "string",
      #     "metadata": {
      #       "tenant_id": "string",
      #       "organization": "string"
      #     }
      #   },
      #   "options": {
      #     "id": "string",
      #     "name": "string",
      #     "email": "string",
      #     "authorization_id": "string",
      #     "metadata": {
      #       "tenant_id": "string",
      #       "organization": "string"
      #     }
      #   }
      # }
      #
      # @param model [Hash] The model
      def cumulio_query(model)
        post "/reporting/cumulio/#{config.organization}/query", model
      end
    end
  end
end
