class PagesController < ApplicationController

    before_action :find_story, only: [:show]
    
    def index

        @stories = Story.published_stories.includes(:likes)
        @stories = @stories.sort_by{ |story| story.likes.count}.reverse!

        # @stories.each do |story|
        #     p story.title 
        #     p story.likes.count
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