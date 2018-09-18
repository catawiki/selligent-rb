module Selligent
  def configure
    Faraday::Middleware.register_middleware selligent_auth: Selligent::Auth
  end

  module_function :configure
end
