class CostumesController < ApplicationController

    def index
        if user_signed_in?
            @costumes = current_user.costumes
        else
            redirect_to root_path
        end
    end

    def show
        if user_signed_in?
            if current_user.costumes.find_by(id: params[:id])
                @costume = current_user.costumes.find_by(id: params[:id])
            else
                redirect_to costumes_path
            end
        else
            redirect_to root_path
        end
    end

    def new
        if user_signed_in?
            @costume = Costume.new
        else
            redirect_to root_path
        end
    end

    def create
        costume = current_user.costumes.build(costume_params)
        if costume.save
            redirect_to costume_path(costume)
        else
            render :new
        end
    end

    def edit
        if user_signed_in?
            if current_user.costumes.find_by(id: params[:id])
                @costume = current_user.costumes.find_by(id: params[:id])
            else
                redirect_to costumes_path
            end
        else
            redirect_to root_path
        end
    end

    def update
        costume = current_user.costumes.find_by(id: params[:id])
        if costume.update(costume_params)
            redirect_to costume_path(costume)
        else
            render :edit
        end
    end

    def destroy
        #to fill out
        costume = current_user.costumes.find_by(id: params[:id])
        if costume
            costume.destroy
            redirect_to costumes_path
        else
            redirect_to costumes_path
        end
    end

    private

    def costume_params
        params.require(:costume).permit(:role, :description, :finished, :authentic, :user_id, :actor_id)
    end
end
