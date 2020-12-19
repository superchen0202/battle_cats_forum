class UsersController < ApplicationController
    
    def pricing

    end

    def payment
        @fee = ENV["price_#{params[:type]}"]
        @payment_type = (params[:type] == "vip") ? "VIP會員" : "白金會員"
        @client_token = gateway.client_token.generate
    end

    def pay
        render html: params
    end

    private 
    def gateway
        
        return Braintree::Gateway.new(
            environment: :sandbox,
            merchant_id: ENV["merchant_id"],
            public_key: ENV["public_key"],
            private_key: ENV["private_key"],
        )
    end

end