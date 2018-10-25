# frozen_string_literal: true

module Selligent
  # Configuration options for the Selligent Client.
  class Configuration
    attr_accessor :host, :api_key, :api_secret, :organization

    def initialize(options = {})
      @host = options[:host]
      @api_key = options[:api_key]
      @api_secret = options[:api_key]
      @organization = options[:organization]
    end

    def inspect
      inspected = super
      inspected.gsub! @api_key, '*******' if @api_key
      inspected.gsub! @api_secret, '*******' if @api_secret

      inspected
    end
  end
end
