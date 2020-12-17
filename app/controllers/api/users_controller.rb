class Api::UsersController < Api::BaseController
  
  before_action :find_user

  # for APi
  def follow
    render json: {status: current_user.follow!(@user) }
  end

  def bookmark
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

end