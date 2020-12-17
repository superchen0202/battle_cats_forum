class Api::StoriesController < Api::BaseController
     
    before_action :find_story

    def like
      current_user.like!(@story)
      render json: {status: @story.likes.count }
    end
      
    private
    def find_story
      @story = Story.friendly.find(params[:id])
    end

end