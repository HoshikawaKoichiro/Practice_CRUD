class BananasController < ApplicationController
    before_action :set_banana, only: %i[ show edit update destroy ]

    def index
        @bananas = Banana.all
    end

    def show
    end

    def new
        @banana = Banana.new
    end

    def edit
    end

    def create
        @banana = Banana.new(banana_params)
        if @banana.save
            redirect_to @banana, notice: "Banana was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @banana.update(banana_params)
            redirect_to @banana, notice: "Banana was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @banana.destroy
        redirect_to bananas_url, notice: "Banana was successfully destroyed."
    end

    def set_banana
        @banana = Banana.find(params[:id])
    end

    def banana_params
        params.require(:banana).permit(:title,:body)
    end

end
