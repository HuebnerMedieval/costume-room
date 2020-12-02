class UsersController < Devise::UsersController
    def show
        if user_signed_in?
            @user = current_user
        else
            redirect_to root_path
        end
    end
end