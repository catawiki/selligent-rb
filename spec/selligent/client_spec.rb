require 'spec_helper'

RSpec.describe Selligent::Client do
  subject(:client) { described_class.new }

  it 'has a configuration' do
    expect(client.config).to be_a(Selligent::Configuration)
  end

  describe 'configure' do
    it 'exposes the config object in a block' do
      client.configure do |config|
        expect(config).to be_a(Selligent::Configuration)
      end
    end
  end
end
