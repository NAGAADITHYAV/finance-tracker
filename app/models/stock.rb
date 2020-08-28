class Stock < ApplicationRecord
    def self.new_lookup(tic_sym) 
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          )
        begin
        new(ticker: tic_sym,name: client.company(tic_sym).company_name,last_price: client.price(tic_sym))
        rescue=>exception
            return nil
        end
    end
end
