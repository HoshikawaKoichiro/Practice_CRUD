class PocketsController < ApplicationController
    before_action :set_pocket, only: %i[ show edit update destroy ]

    def index
        @pockets = Pocket.all
    end

    def show
    end

    def new
        @pocket = Pocket.new
    end

    def edit
    end

    def create
        @pocket = Pocket.new(pocket_params)
        if @pocket.save
            redirect_to @pocket, notice: "Pocket was successfully created."
        else
            render :new, status: :unprocessable_entity            
        end
    end

    def update
        if @pocket.update(pocket_params)
            redirect_to @pocket, notice: "Pocket was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy 
        @pocket.destroy
        redirect_to pockets_url, notice: "Pocket was successfully destroyed."
    end


    def set_pocket
        @pocket = Pocket.find(params[:id])
    end

    def pocket_params
        params.require(:pocket).permit(:title, :body)
    end

end
