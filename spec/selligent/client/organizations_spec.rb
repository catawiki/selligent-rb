# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Client::Organizations do
  include_context 'base_client'

  describe '.organizations' do
    it 'calls the correct endpoint' do
      client.organizations

      expect(client).to have_received(:get).with("#{root_url}/organizations")
    end
  end

  describe '.organization' do
    it 'calls the correct endpoint' do
      client.organization

      expect(client).to have_received(:get).with(base_url)
    end
  end
end
