# frozen_string_literal: true

module Selligent
  class Client
    # Implements the stored procedures endpoints
    #
    # /organizations/:organization/storedprocedures/*
    module StoredProcedures
      # Get stored procedures defined in the given organization
      #
      # @param options [Hash] Additional options
      # @option options [String] :filter Filter by type
      # @option options [String] :search Search by name or description
      def stored_procedures(options = {})
        get "#{base_url}/storedprocedures", options
      end

      # Get details of a stored procedure
      #
      # @param name [String] Name of the stored procedure
      def stored_procedure(name)
        get "#{base_url}/storedprocedures/#{name}"
      end
    end
  end
end
