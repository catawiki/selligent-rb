# frozen_string_literal: true

require 'forwardable'

require 'selligent/authorizer'
require 'selligent/configuration'
require 'selligent/connection'
require 'selligent/middlewares/authorization'

module Selligent
  # The actual Selligent client
  class Client
    extend Forwardable

    include Selligent::Connection

    attr_reader :config

    def_delegators :@authorizer, :auth_header

    def initialize(options = {})
      Selligent::Middlewares::Authorization.setup!
      @config = Selligent::Configuration.new(options)
      @authorizer = Selligent::Authorizer.new(@config)
    end

    def configure
      yield config
    end
  end
end
