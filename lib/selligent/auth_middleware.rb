# frozen_string_literal: true

require 'faraday'

require 'selligent'

module Selligent

  # Auth is a Faraday middleware
  class AuthMiddleware < ::Faraday::Middleware
    AUTH_HEADER = 'Authorization'.freeze

    def call(env)
      env[:request_headers][AUTH_HEADER] = Selligent.auth_header(env)
      @app.call(env)
    end

    def self.setup!
      Faraday::Request.register_middleware selligent_auth: -> { self }
    end
  end
end
