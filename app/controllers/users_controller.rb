class UsersController < ApplicationController
    
    def pricing
    end

    def payment
        @fee = ENV["price_#{params[:type]}"]
        @payment_type = (params[:type] == "vip") ? "VIP會員" : "白金會員"
        @client_token = gateway.client_token.generate
    end

    def pay
        
        #Test for get the nonce from braintree or not
        #render html: params

        fee = ENV["price_#{params[:type]}"]
        nonce = params[:payment_nonce]
    
        result = gateway.transaction.sale(
          amount: fee,
          payment_method_nonce: nonce,
          options: {
            submit_for_settlement: true
          }
        )
    
        
        if result.success?
            current_user.send("#{params[:type]}_user!")   # meta programming
            redirect_to root_path, notice: '付費成功'
        else
            redirect_to root_path, notice: '付費發生錯誤'
        end

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