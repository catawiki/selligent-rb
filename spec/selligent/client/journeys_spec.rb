require 'spec_helper'

RSpec.describe Selligent::Client::Status do
  include_context 'base_client'

  describe '.status' do
    it 'calls the correct endpoint' do
      client.status

      expect(client).to have_received(:get).with("#{root_url}/Status")
    end
  end
end
