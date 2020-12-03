class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordNotUnique, with: :registrations_of_uniqu_username
    
    def record_not_found
        render file: "#{Rails.root}/public/404.html",
        status: :not_found,
        layout: false
    end

    def registrations_of_uniqu_username
        flash[:notice] = "該用戶名稱已經存在，請換別名！"
        render file: "/app/views/devise/registrations/edit.html"
    end

end