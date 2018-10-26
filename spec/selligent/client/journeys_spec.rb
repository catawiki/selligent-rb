require 'spec_helper'

RSpec.describe Selligent::Client::Journeys do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Portal/Api/organizations/my-org' }

  describe '.journeys' do
    it 'calls the correct endpoint' do
      client.journeys

      expect(client).to have_received(:get).with("#{base_url}/journeys")
    end
  end
end
