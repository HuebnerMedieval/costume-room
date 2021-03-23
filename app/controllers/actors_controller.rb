class ActorsController < ApplicationController

    # show route
    def show
        # checks whether user is signed in, and redirects them to the root path if not.
        if user_signed_in?
            # checks that the actor identified in the params belongs to the user
            # if so, the actor and their costumes are stored in instance variables for use in the view
            # if not, the user is redirected to the actors index route
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

    # index route
    def index
        # checks whether the user is signed in, redirecting to the root path if not
        if user_signed_in?
            # checks whether the user filled out the search bar to find a particular actor
            # if so, calls a scope method on the user's actors to only display the ones matching the search
            # if the name parameter is blank, all of the user's actors are saved in an instance variable.
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
