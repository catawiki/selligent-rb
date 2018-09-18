require 'selligent/auth_middleware'

module Selligent
  # Configuration options for the Selligent Client.
  module Configuration
    attr_accessor :username, :host
    attr_writer :api_key

    class << self
      def keys
        @keys ||= %i[
          username
          host
          api_key
        ]
      end
    end

    def set(key, value)
      instance_variable_set(:"@#{key}", value)
    end

    def configure
      yield self
      Selligent::AuthMiddleware.setup!
      nil
    end
  end
end
