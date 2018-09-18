require 'openssl'

module Selligent

  # Auth is a Faraday middleware
  class Auth
    AUTH_HEADER = 'Authorization'.freeze

    def call(env)
      env[:request_headers][AUTH_HEADER] = auth_header
      @app.call(env)
    end

    private

    def auth_header(uri, method:)
      timestamp = Time.now.to_i
      data = "#{timestamp}-#{method}-#{uri.request_uri}"
      hash_code = OpenSSL::HMAC.hexdigest('sha256', key, data)

      "hmac #{username}:#{hash_code}:#{timestamp}"
    end
  end
end
