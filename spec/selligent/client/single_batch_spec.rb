require 'spec_helper'

RSpec.describe Selligent::Client::SingleBatch do
  include_context 'base_client'

  let(:batch_name) { 'the_batch' }

  describe '.single_batches' do
    it 'calls the correct endpoint' do
      client.single_batches

      expect(client).to have_received(:get).with("#{base_url}/journeys/singlebatch")
    end
  end

  describe '.create_single_batch' do
    let(:model) { {} }
    it 'calls the correct endpoint' do
      client.create_single_batch(model)

      expect(client).to have_received(:post).with("#{base_url}/journeys/singlebatch", model)
    end
  end

  describe '.single_batch' do
    it 'calls the correct endpoint' do
      client.single_batch(batch_name)

      expect(client).to have_received(:get).with("#{base_url}/journeys/singlebatch/#{batch_name}")
    end
  end

  describe '.cancel_single_batch' do
    it 'calls the correct endpoint' do
      client.cancel_single_batch(batch_name)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/singlebatch/#{batch_name}/cancel"
      )
    end
  end

  describe '.launch_single_batch' do
    let(:request) { {} }

    it 'calls the correct endpoint' do
      client.launch_single_batch(batch_name, request)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/singlebatch/#{batch_name}/launch",
        request
      )
    end
  end

  describe '.trigger_single_batch' do
    let(:model) { {} }
    it 'calls the correct endpoint' do
      client.trigger_single_batch(batch_name, model)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/singlebatch/#{batch_name}/trigger",
        model
      )
    end
  end

  describe '.send_single_batch_email' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.send_single_batch_email(model)

      expect(client).to have_received(:post).with("#{base_url}/journeys/singlebatch/message", model)
    end
  end

  describe '.send_single_batch_push' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.send_single_batch_push(model)

      expect(client).to have_received(:post).with("#{base_url}/journeys/singlebatch/mobile", model)
    end
  end

  describe '.send_single_batch_sms' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.send_single_batch_sms(model)

      expect(client).to have_received(:post).with("#{base_url}/journeys/singlebatch/sms", model)
    end
  end
end
