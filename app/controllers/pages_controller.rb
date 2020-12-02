class PagesController < ApplicationController
    
    def index
        @stories = Story.order(created_at: :desc).includes(:user)
        #@stories = current_user.stories.order(created_at: :desc)
    end


end