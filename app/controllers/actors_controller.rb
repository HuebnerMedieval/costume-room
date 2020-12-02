class ActorsController < ApplicationController

    def show
        if current_user.actors.find_by(id: params[:id])
            @actor = current_user.actors.find_by(id: params[:id])
        else
            redirect_to actors_path
        end
    end

    def index
        @actors = current_user.actors
    end
end
