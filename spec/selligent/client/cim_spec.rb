# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Client::CIM do
  subject(:client) { base_client.extend(described_class) }

  include_context 'base_client'

  let(:base_url) { '/Portal/Api/organizations/my-org' }
  let(:api_name) { 'campaign' }

  let(:request_id) { '2q3w4e' }
  let(:filters) { [{ field: 'mail', value: 'myuser@example.com' }] }
  let(:data) { { filters: filters } }

  describe '.cim_collect' do
    it 'sends a POST request to collect data' do
      client.cim_collect(api_name, data)

      expect(client).to have_received(:post).with("#{base_url}/cim/#{api_name}/collect", data)
    end
  end

  describe '.cim_optout' do
    it 'sends a POST request to opt out a user' do
      client.cim_optout(api_name, data)

      expect(client).to have_received(:post).with("#{base_url}/cim/#{api_name}/optout", data)
    end
  end

  describe '.cim_remove' do
    it 'sends a POST request to remove data' do
      client.cim_remove(api_name, data)

      expect(client).to have_received(:post).with("#{base_url}/cim/#{api_name}/remove", data)
    end
  end

  describe '.cim_cancel' do
    it 'sends a DELETE request to cancel a CIM request' do
      client.cim_cancel(request_id)

      expect(client).to have_received(:delete).with("#{base_url}/cim/request/#{request_id}")
    end
  end

  describe '.cim_state' do
    it 'sends a GET request to retrieve the state of a CIM request' do
      client.cim_state(request_id)

      expect(client).to have_received(:get).with("#{base_url}/cim/request/#{request_id}/state")
    end
  end

  describe '.cim_result' do
    it 'sends a GET request to retrieve the result of a CIM collect request' do
      client.cim_result(request_id)

      expect(client).to have_received(:get).with("#{base_url}/cim/request/#{request_id}")
    end
  end
end
