class PagesController < ApplicationController

    before_action :find_story, only: [:show]
    
    def index
        #@stories = Story.order(created_at: :desc).includes(:user)
        #@stories = Story.where(status: "published").order(created_at: :desc).includes(:user)
        #@stories = Story.published_stories.order(created_at: :desc).includes(:user)

        @stories = Story.published_stories.includes(:likes)
        @hots = @stories.sort_by{ |story| story.likes.count }

        @top1 =  @hots[-1]
        @top2 =  @hots[-2]
        @top3 =  @hots[-3]

        # @hots.each do |hot|
        #     p hot.title 
        #     p hot.likes.count
        # end

    end

    #find the article user selected to hanlde.
    def show
        @comment = @story.comments.new
        @comments = @story.comments.order(id: :desc)
    end

    private
    def find_story
        @story = Story.friendly.find(params[:story_id])
    end

end