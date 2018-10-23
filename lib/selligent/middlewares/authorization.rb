# frozen_string_literal: true

require 'faraday'

require 'selligent'

module Selligent
  module Middlewares
    # Auth is a Faraday middleware
    class Authorization < ::Faraday::Middleware
      AUTH_HEADER = 'X-ApiKey'.freeze

      def call(env)
        env[:request_headers][AUTH_HEADER] = auth_header
        @app.call(env)
      end

      def self.setup!
        Faraday::Request.register_middleware selligent_auth: -> { self }
      end

      def auth_header
        "#{Selligent.config.api_key}:#{Selligent.config.api_secret}"
      end
    end
  end
end
