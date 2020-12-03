class ActorsController < ApplicationController

    def show
        if user_signed_in?
            if current_user.actors.find_by(id: params[:id])
                @actor = current_user.actors.find_by(id: params[:id])
            else
                redirect_to actors_path
            end
        else
            redirect_to root_path
        end
    end

    def index
        if user_signed_in?
            @actors = current_user.actors.uniq
        else
            redirect_to root_path
        end
    end
end
