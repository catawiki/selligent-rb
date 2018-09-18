# frozen_string_literal: true

require 'selligent/authorization'
require 'selligent/configuration'
require 'selligent/connection'

module Selligent
  # The actual Selligent client
  class Client
    include Selligent::Authorization
    include Selligent::Configuration
    include Selligent::Connection

    def initialize(options = {})
      options.each do |key, value|
        Selligent::Configuration.set(key, value)
      end
    end

    def inspect
      super.gsub! @api_key, '*******' if @api_key
    end
  end
end
