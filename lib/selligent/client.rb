# frozen_string_literal: true

require 'selligent/configuration'
require 'selligent/connection'
require 'selligent/client/content'
require 'selligent/client/cumulio'
require 'selligent/client/data'
require 'selligent/client/journeys'
require 'selligent/client/lists'
require 'selligent/client/organizations'
require 'selligent/client/single_batch'
require 'selligent/client/status'
require 'selligent/client/stored_procedures'
require 'selligent/client/tasks'
require 'selligent/client/transactional_bulk'
require 'selligent/client/transactionals'
require 'selligent/middlewares/authorization'

module Selligent
  # The actual Selligent client
  class Client
    extend Forwardable

    include Selligent::Connection
    include Selligent::Client::Content
    include Selligent::Client::Cumulio
    include Selligent::Client::Data
    include Selligent::Client::Journeys
    include Selligent::Client::Lists
    include Selligent::Client::Organizations
    include Selligent::Client::SingleBatch
    include Selligent::Client::Status
    include Selligent::Client::StoredProcedures
    include Selligent::Client::Tasks
    include Selligent::Client::TransactionalBulk
    include Selligent::Client::Transactionals

    attr_reader :config

    def initialize(options = {})
      Selligent::Middlewares::Authorization.setup!
      @config = Selligent::Configuration.new(options)
    end

    def configure
      yield config
    end

    def root_url
      '/Portal/Api'
    end

    def base_url
      "#{root_url}/organizations/#{config.organization}"
    end
  end
end
