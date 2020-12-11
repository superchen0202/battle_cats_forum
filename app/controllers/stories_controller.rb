class StoriesController < ApplicationController

    before_action :authenticate_user!, except: [:like]
    before_action :find_story, only: [:show, :edit, :update, :destroy,]
    skip_before_action :verify_authenticity_token, only: [:like]
    
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

        if params[:publish]
            @story.publish!
        end
    
        if @story.save
          if params[:publish]
            redirect_to stories_path, notice: '已成功發佈故事'
          else
            redirect_to edit_story_path(@story), notice: '故事已儲存'
          end
        else
          render :new
        end
    end

    def edit     
    end

    def update

        if @story.update(story_params)
            case
            when params[:publish]
              @story.publish!
              redirect_to stories_path, notice: '故事已發佈'
            when params[:unpublish]
              @story.unpublish!
              redirect_to stories_path, notice: '故事已下架'
            else
              redirect_to edit_story_path(@story), notice: '故事已儲存'
            end
          else
            render :edit
          end
    end

    def destroy
       
        @story.destroy
        redirect_to stories_path, notice: "故事已被刪除"
    
    end
    

    def like
      if user_signed_in?
        render json: {status: "登入" }
      else
        render json: {status: '還沒登入'}
      end
    end
      

    private
    def story_params
        params.require(:story).permit(:title, :content, :cover_img)
    end

    def find_story
        @story = current_user.stories.friendly.find(params[:id])
    end

end