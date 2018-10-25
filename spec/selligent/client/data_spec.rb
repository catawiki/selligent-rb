require 'spec_helper'

RSpec.describe Selligent::Client::Data do
  subject(:client) do
    instance_double(
      Selligent::Client,
      get: nil,
      post: nil,
      delete: nil,
      base_url: base_url
    ).extend(described_class)
  end

  let(:base_url) { '/Portal/Api/organizations/my-org' }
  let(:api_name) { 'campaign' }
  let(:segment_api_name) { 'campaign_segment' }

  describe '.delete_data' do
    it 'calls delete_data endpoint' do
      client.delete_data(api_name)

      expect(client).to have_received(:delete).with("#{base_url}/lists/#{api_name}/data")
    end
  end

  describe '.load_data' do
    it 'calls load_data endpoint' do
      client.load_data(api_name)

      expect(client).to have_received(:post).with("#{base_url}/lists/#{api_name}/data/load")
    end
  end

  describe '.search_data' do
    it 'calls search_data endpoint' do
      client.search_data(api_name)

      expect(client).to have_received(:post).with("#{base_url}/lists/#{api_name}/data/search")
    end
  end

  describe '.delete_data_from_segment' do
    it 'calls delete_data_from_segment endpoint' do
      client.delete_data_from_segment(api_name, segment_api_name)

      expect(client).to have_received(:delete).with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data")
    end
  end


  describe '.load_data_into_segment' do
    it 'calls load_data_into_segment endpoint' do
      client.load_data_into_segment(api_name, segment_api_name)

      expect(client).to have_received(:post).with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/load")
    end
  end


  describe '.search_data_within_segment' do
    it 'calls search_data_within_segment endpoint' do
      client.search_data_within_segment(api_name, segment_api_name)

      expect(client).to have_received(:post).with("#{base_url}/lists/#{api_name}/segments/#{segment_api_name}/data/search")
    end
  end
end
