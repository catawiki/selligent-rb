# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Configuration do
  subject(:config) { described_class.new(username: 'catawiki', api_key: 'secret') }

  describe '.inspect' do
    it 'hides the api key' do
      expect(config.inspect).not_to include('secret')
    end

    it 'replaces the api key with stars' do
      expect(config.inspect).to include('***')
    end
  end
end
