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
        #to fill out
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
        #to fill out
    end

    def destroy
        #to fill out
    end
end
