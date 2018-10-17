require 'faraday'

module Selligent
  # Network layer
  module Connection
    def get(url, options = {})
      connection.get url, options
    end

    def post
      connection.post url, options
    end

    def put
      connection.put url, options
    end

    private

    def connection
      @connection ||= Faraday.new(url: host)
    end
  end
end
