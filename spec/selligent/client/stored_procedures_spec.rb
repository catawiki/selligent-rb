# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Client::StoredProcedures do
  include_context 'base_client'

  describe '.stored_procedures' do
    let(:options) { { search: 'search_string', filter: 'the_type' } }

    it 'calls the correct endpoint' do
      client.stored_procedures(options)

      expect(client).to have_received(:get).with("#{base_url}/storedprocedures", options)
    end
  end

  describe '.stored_procedure' do
    let(:name) { 'cool_procedure' }

    it 'calls the correct endpoint' do
      client.stored_procedure(name)

      expect(client).to have_received(:get).with("#{base_url}/storedprocedures/#{name}")
    end
  end
end
