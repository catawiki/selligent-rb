require 'spec_helper'

RSpec.describe Selligent::Client::Cumulio do
  include_context 'base_client'

  before do
    allow(client).to receive(:config).and_return(OpenStruct.new(organization: 'my-org'))
  end

  describe '.cumulio_datasets' do
    it 'calls the correct endpoint' do
      client.cumulio_datasets

      expect(client).to have_received(:get).with("#{root_url}/reporting/cumulio/my-org/datasets")
    end
  end

  describe '.cumulio_datasets' do
    let(:model) { {} }
    it 'calls the correct endpoint' do
      client.cumulio_query(model)

      expect(client).to have_received(:post).with("#{root_url}/reporting/cumulio/my-org/query", model)
    end
  end
end
