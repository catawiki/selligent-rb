# frozen_string_literal: true

module Selligent
  class Client
    # Implements the Status endpoint
    #
    # /Status
    module Status
      # Get the Selligent status
      def status
        get "#{root_url}/Status"
      end
    end
  end
end
