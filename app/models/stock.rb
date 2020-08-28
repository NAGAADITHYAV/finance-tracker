class Stock < ApplicationRecord
    def self.new_lookup(tic_sym) 
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        client.price(tic_sym)
    end
end
