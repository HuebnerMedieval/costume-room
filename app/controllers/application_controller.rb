class ApplicationController < ActionController::Base
    
    # welcome screen
    def home
        @user = current_user
    end

end
