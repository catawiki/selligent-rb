# frozen_string_literal: true

require 'openssl'

module Selligent
  # Implements the authorization header for Selligent requests
  class Authorizer
    attr_reader :config, :time
    private :config, :time

    def initialize(config, time: Time)
      @config = config
      @time = time
    end

    def auth_header(env)
      timestamp = time.now.to_i
      data = "#{timestamp}-#{env[:method]}-#{env[:url]}"
      hash_code = OpenSSL::HMAC.hexdigest('sha256', config.api_key, data)

      "hmac #{config.username}:#{hash_code}:#{timestamp}"
    end
  end
end
