require 'openssl'

module Selligent
  module Authentication
    def auth_header(uri, method:)
      timestamp = Time.now.to_i
      data = "#{timestamp}-#{method}-#{uri.request_uri}"
      hash_code = OpenSSL::HMAC.hexdigest('sha256', key, data)

      "hmac #{username}:#{hash_code}:#{timestamp}"
    end
  end
end
