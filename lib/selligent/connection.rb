require 'faraday'

module Selligent
  module Connection
    def get(path, params = {})
      connection.get uri(path, params)
    end

    def post(path, params = {})
      connection.post uri(path, params)
    end

    def put(path, params = {})
      connection.put uri(path, params)
    end

    def uri(path, params)
      URI::HTTP.build(path: path, query: URI::QueryParams.dump(params))
    end

    def connection
      # TODO: To Config
      Faraday.new(url: 'http://www.selligent.com') do |conn|
        conn.request :selligent_auth
      end
    end
  end
end
