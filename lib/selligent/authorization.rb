# frozen_string_literal: true

require 'openssl'

module Selligent
  module Authorization
    def auth_header(env)
      timestamp = Time.now.to_i
      data = "#{timestamp}-#{env.method}-#{env.url}"
      hash_code = OpenSSL::HMAC.hexdigest('sha256', @api_key, data)

      "hmac #{username}:#{hash_code}:#{timestamp}"
    end
  end
end
