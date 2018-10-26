# frozen_string_literal: true

module Selligent
  class Client
    # Implements the organizations endpoints
    #
    # /organizations/*
    module Organizations
      # Get an overview of all the organizations
      def organizations
        get "#{root_url}/organizations"
      end

      # Get details of the current organization
      def organization
        get base_url
      end
    end
  end
end
