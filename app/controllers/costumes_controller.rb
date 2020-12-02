class CostumesController < ApplicationController

    def index
        @costumes = current_user.costumes
    end

    def show
        if current_user.costumes.find_by(id: params[:id])
            @costume = current_user.costumes.find_by(id: params[:id])
        else
            redirect_to costumes_path
        end
    end

    def new
        @costume = Costume.new
    end

    def create
        #to fill out
    end

    def edit
        if current_user.costumes.find_by(id: params[:id])
            @costume = current_user.costumes.find_by(id: params[:id])
        else
            redirect_to costumes_path
        end
    end

    def update
        #to fill out
    end

    def destroy
        #to fill out
    end
end
