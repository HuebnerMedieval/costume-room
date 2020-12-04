class ApplicationController < ActionController::Base
    
    def home
        @user = current_user
    end

end
