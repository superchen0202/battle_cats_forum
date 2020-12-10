class UsersController < ApplicationController
  
  before_action :find_user
  skip_before_action :verify_authenticity_token, only: [:follow]
    
  # for APi
  def follow
    
    if user_signed_in?
      render json: {status: current_user.follow!(@user) }
    else
      render json: {status: '還沒登入'}
    end

  end

  private
  def find_user
    @user = User.find(params[:id])
  end

end