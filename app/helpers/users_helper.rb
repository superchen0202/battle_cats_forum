module UsersHelper

    def avatar_tag( user, size: 100)
       
        if user.avatar.attached?
            image_tag user.avatar.variant( resize: "#{size} x #{size}"), class: "user-avatar"
        end
    end

end