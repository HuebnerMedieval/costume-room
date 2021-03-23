class CostumesController < ApplicationController
    # calls the #require_login helper method before any controller action
    before_action :require_login

    # costume index route
    def index
        # saves all of the user's costumes in an instance variable for use in the view
        @user_costumes = current_user.costumes

        # checks whether the user is filtering by authenticity
        if !params[:authenticity].blank?
            # if the authenticity parameter is fantasy, saves all of the user's costumes marked fantasy in an instance variable
            if params[:authenticity] == "Fantasy"
                @costumes = @user_costumes.fantasy
            # if the authenticity parameter is used, and it is not fantasy, it must be authentic.
            else
                @costumes = @user_costumes.authentic
            end
        # checks whether the user is filtering by status
        elsif !params[:status].blank?
            # if the status param is "Work in Progress", saves the relevant costumes to the instance variable
            if params[:status] == "Work in Progress"
                @costumes = @user_costumes.wip
            # if the status param is not "Work in Progress", it must be finished
            else
                @costumes = @user_costumes.finished
            end
        # if no filters are used, all of the user's costumes are stored in the instance variable for use by the view
        else
            @costumes = @user_costumes
        end
    end

    # show route
    def show
        # if the desired costume belongs to the user, saves it as an instance variable for use in the view
        # if not, the user is redirected to the costume index route
        if current_user.costumes.find_by(id: params[:id])
            assign_costume
        else
            redirect_to costumes_path
        end
    end

    # new costume route
    def new
        # saves a blank costume as an instance variable, to be used by the form in the view
        @costume = Costume.new
        # if there is an actor_id in the params, it means the form is being accessed as a nested form for a particular actor.
        # that actor is automatically assigned as the new costume's owner.
        # If not, then all actors are saved so they can be listed in the view.
        if params[:actor_id]
            @costume.actor_id = params[:actor_id]
        else
            @actors = Actor.all
        end
    end

    # Costume create route.
    def create
        # instantiates a new costume, belonging to the current user, using the parameters from the new costume form
        @costume = current_user.costumes.build(costume_params)
        # if the new costume saves successfully, it means the fields are valid and the user is redirected to the show route for that costume.
        if @costume.save
            redirect_to costume_path(@costume)
        # if the new costume won't save, something went wrong and the new form is re-rendered.
        else
            @actors = Actor.all
            render :new
        end
    end

    # edit costume route
    def edit
        # checks that the costume belongs to the current user
        # if so, it is saved as an instance variable
        if current_user.costumes.find_by(id: params[:id])
            assign_costume
        # if not, the user should not be editing it, and they are redirected to the index route
        else
            redirect_to costumes_path
        end
    end

    # update costume route
    def update
        # grabs the costume to be updated
        costume = current_user.costumes.find_by(id: params[:id])
        # if the costume updates successfully with the params from the form, the user is redirected to the show route for that costume
        if costume.update(costume_params)
            redirect_to costume_path(costume)
        # if not, the edit form is rerendered
        else
            render :edit
        end
    end

    # destroy route
    def destroy
        # grabs the desired costume from the params
        costume = current_user.costumes.find_by(id: params[:id])
        # if that costume exists, it is destroyed and the user redirected to the index route
        if costume
            costume.destroy
            redirect_to costumes_path
        # if not, the user is redirected without destroying anything
        else
            redirect_to costumes_path
        end
    end

    private

    # sets strong params
    def costume_params
        params.require(:costume).permit(:role, :description, :finished, :authentic, :user_id, :actor_id, actor_attributes: [:name])
    end

    # checks that the user is logged in, redirecting them to the root path if not.
    def require_login
        if !user_signed_in?
            redirect_to root_path
        end
    end

    # assigns an instance variable to the costume identified by the params if it belongs to the current user.
    def assign_costume
        @costume = current_user.costumes.find_by(id: params[:id])
    end

end
