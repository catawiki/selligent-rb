require 'spec_helper'

RSpec.describe Selligent::Client::Tasks do
  include_context 'base_client'

  subject(:client) { base_client.extend(described_class) }

  let(:base_url) { '/Portal/Api/organizations/my-org' }
  let(:task_name) { 'some_task' }

  describe '.tasks' do
    let(:options) { { search: 'search_string', filter: 'the_type', take: 50, skip: 100 } }

    it 'calls the correct endpoint' do
      client.tasks(options)

      expect(client).to have_received(:get).with("#{base_url}/tasks", options)
    end
  end

  describe '.task' do
    it 'calls the correct endpoint' do
      client.task(task_name)

      expect(client).to have_received(:get).with("#{base_url}/tasks/#{task_name}")
    end
  end

  describe '.task_actions' do
    it 'calls the correct endpoint' do
      client.task_actions(task_name)

      expect(client).to have_received(:get).with("#{base_url}/tasks/#{task_name}/actions")
    end
  end

  describe '.disable_task' do
    it 'calls the correct endpoint' do
      client.disable_task(task_name)

      expect(client).to have_received(:post).with("#{base_url}/tasks/#{task_name}/actions/disable")
    end
  end

  describe '.enable_task' do
    it 'calls the correct endpoint' do
      client.enable_task(task_name)

      expect(client).to have_received(:post).with("#{base_url}/tasks/#{task_name}/actions/enable")
    end
  end

  describe '.run_task' do
    it 'calls the correct endpoint' do
      client.run_task(task_name)

      expect(client).to have_received(:post).with("#{base_url}/tasks/#{task_name}/actions/run")
    end
  end
end
