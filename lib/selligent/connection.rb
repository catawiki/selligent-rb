require 'faraday'

module Selligent
  module Connection
    include Authentication

    def get(path, params = {})
      uri = URI::HTTP.build(path: path, query: URI::QueryParams.dump(params))
      
      connection.get(path) do |req|
        req.headers['Authentication'] = auth_header(uri, method: 'GET')
      end
    end

    def post(path, params = {})
      connection.post(path) do |req|
        req.headers['Authentication'] = auth_header(uri, method: 'POST')
      end
    end

    def put(path, params = {})
      connection.put(path) do |req|
        req.headers['Authentication'] = auth_header(uri, method: 'PUT')
      end
    end

    def connection
      # TODO: To Config
      Faraday.new(url: 'http://www.selligent.com')
    end
  end
end
