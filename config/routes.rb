Rails.application.routes.draw do

  root 'pages#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
   registrations: 'users/registrations'
  }

  #API routes：
  namespace :api do
    
    resources :users, only:[] do 
      
      # /api/users/:id/follow
      member do
        post :follow
      end

      # /api/users/:id/bookmark
      member do 
        post :bookmark
      end

    end

    # /api/stories/:id/like
    resources :stories, only:[] do
      member do
        post :like 
      end
    end 
    
    post :upload_image, to:'utils#upload_image'
  end

  # /user/pricing
  # /user/payment
  resources :users, only:[] do
    collection do 
      get :pricing
      get :payment
      post :pay
    end
  end

  # /story/comment
  resources :stories do
    resources :comments, only: [:create]
  end 
  
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  get '@:username', to: 'pages#user', as: 'user_page' 

  #get '/demo', to: 'pages#demo'
end