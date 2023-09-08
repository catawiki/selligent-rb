# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Selligent::Client::Lists do
  include_context 'base_client'

  let(:list_name) { 'the_list' }

  describe 'lists' do
    describe '.lists' do
      it 'calls the correct endpoint' do
        client.lists

        expect(client).to have_received(:get).with("#{base_url}/lists", {})
      end
    end

    describe '.create_list' do
      let(:model) { {} }

      it 'calls the correct endpoint' do
        client.create_list(model)

        expect(client).to have_received(:post).with("#{base_url}/lists", model)
      end
    end

    describe '.delete_list' do
      let(:options) { { dropTable: false } }

      it 'calls the correct endpoint' do
        client.delete_list(list_name, options)

        expect(client).to have_received(:delete).with("#{base_url}/lists/#{list_name}", options)
      end
    end

    describe '.list' do
      it 'calls the correct endpoint' do
        client.list(list_name)

        expect(client).to have_received(:get).with("#{base_url}/lists/#{list_name}")
      end
    end

    describe '.update_list' do
      let(:model) { {} }

      it 'calls the correct endpoint' do
        client.update_list(list_name, model)

        expect(client).to have_received(:put).with("#{base_url}/lists/#{list_name}", model)
      end
    end
  end

  describe 'fields' do
    let(:field_name) { 'the_field' }

    describe '.fields' do
      it 'calls the correct endpoint' do
        client.fields(list_name)

        expect(client).to have_received(:get).with("#{base_url}/lists/#{list_name}/fields")
      end
    end

    describe '.create_fields' do
      let(:model) { {} }

      it 'calls the correct endpoint' do
        client.create_fields(list_name, model)

        expect(client).to have_received(:post).with("#{base_url}/lists/#{list_name}/fields", model)
      end
    end

    describe '.delete_field' do
      it 'calls the correct endpoint' do
        client.delete_field(list_name, field_name)

        expect(client).to have_received(:delete).with(
          "#{base_url}/lists/#{list_name}/fields/#{field_name}"
        )
      end
    end

    describe '.update_field' do
      let(:model) { {} }

      it 'calls the correct endpoint' do
        client.update_field(list_name, field_name, model)

        expect(client).to have_received(:put).with(
          "#{base_url}/lists/#{list_name}/fields/#{field_name}",
          model
        )
      end
    end
  end

  describe 'records' do
    describe '.records_count' do
      it 'calls the correct endpoint' do
        client.records_count(list_name)

        expect(client).to have_received(:get).with("#{base_url}/lists/#{list_name}/records")
      end
    end

    describe '.delete_record' do
      let(:record_id) { 42 }

      it 'calls the correct endpoint' do
        client.delete_record(list_name, record_id)

        expect(client).to have_received(:delete).with(
          "#{base_url}/lists/#{list_name}/records/#{record_id}"
        )
      end
    end
  end

  describe 'relations' do
    let(:scope) { 'the_relation_name' }

    describe '.relations' do
      it 'calls the correct endpoint' do
        client.relations(list_name)

        expect(client).to have_received(:get).with("#{base_url}/lists/#{list_name}/relations")
      end
    end

    describe '.create_relation' do
      let(:model) { {} }

      it 'calls the correct endpoint' do
        client.create_relation(list_name, model)

        expect(client).to have_received(:post).with(
          "#{base_url}/lists/#{list_name}/relations",
          model
        )
      end
    end

    describe '.delete_relation' do
      it 'calls the correct endpoint' do
        client.delete_relation(list_name, scope)

        expect(client).to have_received(:delete).with(
          "#{base_url}/lists/#{list_name}/relations/#{scope}"
        )
      end
    end

    describe '.relation' do
      it 'calls the correct endpoint' do
        client.relation(list_name, scope)

        expect(client).to have_received(:get).with(
          "#{base_url}/lists/#{list_name}/relations/#{scope}"
        )
      end
    end

    describe '.update_relation' do
      let(:model) { {} }
      it 'calls the correct endpoint' do
        client.update_relation(list_name, scope, model)

        expect(client).to have_received(:put).with(
          "#{base_url}/lists/#{list_name}/relations/#{scope}",
          model
        )
      end
    end
  end

  describe 'segments' do
    describe '.segments' do
      let(:options) { {} }
      it 'calls the correct endpoint' do
        client.segments(list_name, options)

        expect(client).to have_received(:get).with(
          "#{base_url}/lists/#{list_name}/segments",
          options
        )
      end
    end

    describe '.segment' do
      let(:segment_name) { 'the_segment' }

      it 'calls the correct endpoint' do
        client.segment(list_name, segment_name)

        expect(client).to have_received(:get).with(
          "#{base_url}/lists/#{list_name}/segments/#{segment_name}"
        )
      end
    end
  end
end
