class Api::BaseController < ApplicationController

    skip_before_action :verify_authenticity_token
    before_action :check_log_in

    def check_log_in
        unless user_signed_in?       
            render json: {status: '請先登入'}
        end
    end

end