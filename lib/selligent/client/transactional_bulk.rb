# frozen_string_literal: true

module Selligent
  class Client
    # Implements the transactional bulk endpoint
    #
    # /organizations/:organization/journeys/transcational/bulk/:name/send
    module TransactionalBulk
      # Trigger a bulk journey in a transactional way
      #
      # @params name [String] The name of the execution that should be sent
      def send_transactional_bulk(name)
        post "#{base_url}/journeys/transactional/bulk/#{name}/send"
      end
    end
  end
end
