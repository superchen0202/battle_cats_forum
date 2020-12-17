class Api::UsersController < Api::BaseController
  
  before_action :find_user, only: [:follow]

  # for APi
  def follow
    render json: {status: current_user.follow!(@user) }
  end

  def bookmark
    render json: {status: "收到API"}
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

end