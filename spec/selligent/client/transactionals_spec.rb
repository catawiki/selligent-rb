require 'spec_helper'

RSpec.describe Selligent::Client::Transactionals do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Portal/Api/organizations/my-org' }
  let(:api_name) { 'campaign' }

  describe '.transactionals' do
    it 'calls the transactional endpoint' do
      client.transactionals

      expect(client).to have_received(:get).with("#{base_url}/journeys/transactional")
    end
  end

  describe '.transactional' do
    it 'calls the correct endpoint' do
      client.transactional(api_name)

      expect(client).to have_received(:get).with("#{base_url}/journeys/transactional/#{api_name}")
    end
  end

  describe '.send_transactional' do
    let(:model) do
      {
        items: [
          email: 'info@example.com',
          language: 'EN',
          data: {},
          dtsdata: []
        ]
      }
    end

    it 'calls the correct endpoint' do
      client.send_transactional(api_name, model)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/transactional/#{api_name}/send",
        model
      )
    end
  end

  describe 'update_profile_and_send_transactional' do
    let(:model) do
      {
        items: [
          email: 'info@example.com',
          language: 'EN',
          profile: [
            scope: 'MASTER',
            fields: {
              'Name' => 'John',
              'LastName' => 'Smith'
            }
          ],
          data: {},
          dtsdata: []
        ]
      }
    end

    it 'calls the correct endpoint' do
      client.update_profile_and_send_transactional(api_name, model)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/transactional/#{api_name}/updateProfileAndSend",
        model
      )
    end
  end

  describe 'transactionals_status' do
    let(:message_ids) { %w[123 234] }

    it 'calls the correct endpoint' do
      client.transactionals_status(message_ids)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/transactional/status",
        message_ids
      )
    end
  end

  describe 'transactional_status' do
    let(:message_id) { '123' }

    it 'calls the correct endpoint' do
      client.transactional_status(message_id)

      expect(client).to have_received(:get).with(
        "#{base_url}/journeys/transactional/status/#{message_id}"
      )
    end
  end
end
