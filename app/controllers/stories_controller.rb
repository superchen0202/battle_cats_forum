class StoriesController < ApplicationController

    before_action :authenticate_user!
    before_action :find_story, only: [:show, :edit, :update, :destroy]

    def index
        @stories = current_user.stories.order(created_at: :desc)
    end

    def show
    end

    def new
        @story = current_user.stories.new
    end

    def create

        @story = current_user.stories.new(story_params)
        
        if params[:published]
            @story.status = "published"
        end

        if @story.save
            
            if @story.status == "published"
                redirect_to stories_path, notice: "故事新增成功！"
            else
                redirect_to new_story_path, notice: "已儲存草稿！"
            end
            
        else
            render :new
        end
    end

    def edit     
    end

    def update

        if @story.update(story_params)
            redirect_to stories_path, notice: "故事修改成功！"
        else
            render :edit
        end
    end

    def destroy
       
        @story.destroy
        redirect_to stories_path, notice: "故事已被刪除"
    
    end

    private
    def story_params
        params.require(:story).permit(:title, :content)
    end

    def find_story
        @story = current_user.stories.find(params[:id])
    end

end