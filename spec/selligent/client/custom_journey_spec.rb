require 'spec_helper'

RSpec.describe Selligent::Client::CustomJourney do
  include_context 'base_client'

  describe '.custom_journey' do
    let(:api_name) { 'new_journey' }
    let(:entrypoint_name) { 'new_entrypoint' }
    let(:input) do
      {
        user_id: 0,
        parameter_values: {
          catawiki_id: 123,
          bid_timestamp: Time.now.to_s
        }
      }
    end

    it 'calls the correct endpoint' do
      client.trigger_custom_journey(api_name, entrypoint_name, input)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/custom/#{api_name}/entrypoints/#{entrypoint_name}/trigger",
        input
      )
    end
  end
end
