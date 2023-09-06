# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Client::TransactionalBulk do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Portal/Api/organizations/my-org' }

  describe '.send_transactional_bulk' do
    let(:name) { 'execution_name' }

    it 'calls the correct endpoint' do
      client.send_transactional_bulk(name)

      expect(client).to have_received(:post).with(
        "#{base_url}/journeys/transactional/bulk/#{name}/send"
      )
    end
  end
end
