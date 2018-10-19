# frozen_string_literal: true

require 'selligent/authorization'
require 'selligent/configuration'
require 'selligent/connection'
require 'selligent/middlewares/authorization'

module Selligent
  # The actual Selligent client
  class Client
    include Selligent::Authorization
    include Selligent::Connection

    attr_reader :config

    def initialize(options = {})
      Selligent::Middlewares::Authorization.setup!
      @config = Selligent::Configuration.new(options)
    end

    def configure
      yield config
    end
  end
end
