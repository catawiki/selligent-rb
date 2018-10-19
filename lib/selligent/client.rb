# frozen_string_literal: true

require 'selligent/authorization'
require 'selligent/configuration'
require 'selligent/connection'

module Selligent
  # The actual Selligent client
  class Client
    include Selligent::Authorization
    include Selligent::Connection

    attr_reader :config

    def initialize(options = {})
      Selligent::AuthMiddleware.setup!
      @config = Selligent::Configuration.new(options)
    end

    def configure
      yield config
    end
  end
end
