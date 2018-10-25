require 'selligent'
require 'timecop'
require 'webmock/rspec'

# Allow connections to codeclimate for code coverage
# WebMock.disable_net_connect!(allow: 'codeclimate.com', allow_localhost: false)
WebMock.disable_net_connect!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.order = :random
  srand config.seed

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context 'base_client', shared_context: :metadata do
  let(:base_client) do
    instance_double(
      Selligent::Client,
      get: nil,
      post: nil,
      put: nil,
      delete: nil,
      base_url: base_url
    )
  end
end

RSpec.configure do |config|
  config.include_context 'base_client', include_shared: true
end
