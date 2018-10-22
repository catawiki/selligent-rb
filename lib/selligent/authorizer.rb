# frozen_string_literal: true

require 'openssl'

module Selligent
  # Implements the authorization header for Selligent requests
  class Authorizer
    attr_reader :config
    private :config

    def initialize(config)
      @config = config
    end

    def auth_header(env)
      timestamp = Time.now.to_i
      "hmac #{config.username}:#{auth_hash(env, timestamp)}:#{timestamp}"
    end

    private

    def auth_hash(env, timestamp)
      OpenSSL::HMAC.hexdigest(
        'sha256',
        config.api_key,
        "#{timestamp}-#{env[:method]}-#{env[:url]}"
      )
    end
  end
end
