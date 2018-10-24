require 'faraday'
require 'faraday_middleware'

module Selligent
  # Network layer
  module Connection
    def get(url, options = {})
      connection.get url, options
    end

    def post(url, options = {})
      connection.post url, options
    end

    def put(url, options = {})
      connection.put url, options
    end

    private

    def connection
      @connection ||= Faraday.new(url: config.host) do |conn|
        conn.request :json
        conn.request :selligent_auth

        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
