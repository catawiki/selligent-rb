require 'spec_helper'

RSpec.describe Selligent::Client::Data do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Portal/Api/organizations/my-org' }
  let(:api_name) { 'campaign' }
  let(:segment_api_name) { 'campaign_segment' }

  describe '.delete_data' do
    let(:options) { { mode: 'Stream' } }

    it 'calls delete_data endpoint' do
      client.delete_data(api_name, options)

      expect(client).to have_received(:delete).with("#{base_url}/lists/#{api_name}/data", options)
    end
  end

  describe '.load_data' do
    let(:options) { { deduplication: 'ImportFirstMatch' } }

    it 'calls load_data endpoint' do
      client.load_data(api_name, options)

      expect(client)
        .to have_received(:post)
        .with("#{base_url}/lists/#{api_name}/data/load", options)
    end
  end

  describe '.search_data' do
    let(:options) { { mode: 'Stream' } }

    it 'calls search_data endpoint' do
      client.search_data(api_name, options)

      expect(client)
        .to have_received(:post)
        .with("#{base_url}/lists/#{api_name}/data/search", options)
    end
  end

  describe '.delete_data_from_segment' do
    let(:options) { { mode: 'Stream' } }

    it 'calls delete_data_from_segment endpoint' do
      client.delete_data_from_segment(api_name, segment_api_name, options)

      expect(client)
        .to have_received(:delete)
        .with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data", options)
    end
  end

  describe '.load_data_into_segment' do
    let(:options) { { deduplication: 'ImportFirstMatch' } }

    it 'calls load_data_into_segment endpoint' do
      client.load_data_into_segment(api_name, segment_api_name, options)

      expect(client)
        .to have_received(:post)
        .with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/load", options)
    end
  end

  describe '.search_data_within_segment' do
    let(:options) { { mode: 'Stream' } }

    it 'calls search_data_within_segment endpoint' do
      client.search_data_within_segment(api_name, segment_api_name, options)

      expect(client)
        .to have_received(:post)
        .with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/search", options)
    end
  end
end
