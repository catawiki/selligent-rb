# frozen_string_literal: true

require 'selligent/client'

# Selligent API client
module Selligent
  class << self
    def client
      @client ||= Selligent::Client.new
    end

    private

    def respond_to_missing?(method_name, include_private = false)
      client.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      return client.send(method_name, *args, &block) if client.respond_to?(method_name)

      super
    end
  end
end
