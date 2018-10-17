# frozen_string_literal: true

module Selligent
  class << self
    def client
      @client ||= Selligent::Client.new
    end
  end
end

