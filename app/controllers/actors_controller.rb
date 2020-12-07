class ActorsController < ApplicationController

    def show
        if user_signed_in?
            if current_user.actors.find_by(id: params[:id])
                @actor = current_user.actors.find_by(id: params[:id])
                @costumes = @actor.costumes.where(user: current_user)
            else
                redirect_to actors_path
            end
        else
            redirect_to root_path
        end
    end

    def index
        if user_signed_in?
            
            if params[:name]
                @actors = current_user.actors.found(params[:name]).uniq
            else
                @actors = current_user.actors.uniq
            end
        else
            redirect_to root_path
        end
    end
end
