require 'spec_helper'

RSpec.describe Selligent::Client::Content do
  include_context 'base_client'

  let(:params) { { publish: true } }

  describe '.create_email' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.create_email(model, params)

      expect(client).to have_received(:post).with("#{base_url}/content/message", model)
    end
  end

  describe '.create_push_message' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.create_push_message(model, params)

      expect(client).to have_received(:post).with("#{base_url}/content/mobile", model)
    end
  end

  describe '.create_page' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.create_page(model, params)

      expect(client).to have_received(:post).with("#{base_url}/content/page", model)
    end
  end

  describe '.create_sms' do
    let(:model) { {} }

    it 'calls the correct endpoint' do
      client.create_sms(model, params)

      expect(client).to have_received(:post).with("#{base_url}/content/sms", model)
    end
  end
end
