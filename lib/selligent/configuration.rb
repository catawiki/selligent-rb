# frozen_string_literal: true

module Selligent
  # Configuration options for the Selligent Client.
  class Configuration
    attr_accessor :username, :host, :api_key

    def initialize(options = {})
      @username = options[:username]
      @host = options[:host]
      @api_key = options[:api_key]
    end

    def inspect
      super.gsub! @api_key, '*******' if @api_key
    end
  end
end
