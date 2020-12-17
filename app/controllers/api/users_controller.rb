class Api::UsersController < Api::BaseController
  
  before_action :find_user, only: [:follow]
  before_action :find_story, only: [:bookmark]

  # for APi
  def follow
    render json: {status: current_user.follow!(@user) }
  end

  # for APi
  def bookmark
    render json: {status: current_user.bookmark!(@story)}
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def find_story
    @story = Story.friendly.find(params[:id])
  end

end