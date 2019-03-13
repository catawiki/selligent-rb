# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module Selligent
  # Network layer
  module Connection
    def get(url, options = {}, &block)
      connection.get url, options, &block
    end

    def post(url, options = {}, &block)
      connection.post url, options, &block
    end

    def put(url, options = {}, &block)
      connection.put url, options, &block
    end

    def delete(url, options = {}, &block)
      connection.delete url, options, &block
    end

    private

    def connection
      @connection ||= Faraday.new(url: config.host) do |conn|
        conn.request :json
        conn.request :selligent_auth

        conn.response :json, parser_options: { symbolize_names: true }
        conn.response :raise_error

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
