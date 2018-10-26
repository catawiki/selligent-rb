require 'spec_helper'

RSpec.describe Selligent::Client::Journeys do
  include_context 'base_client'

  describe '.journeys' do
    it 'calls the correct endpoint' do
      client.journeys

      expect(client).to have_received(:get).with("#{base_url}/journeys")
    end
  end
end
